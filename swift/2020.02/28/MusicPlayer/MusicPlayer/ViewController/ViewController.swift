//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Soohan Lee on 2020/02/28.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var indicatorView: UIActivityIndicatorView!
  
  private let searchController = UISearchController(searchResultsController: nil)
  
  private let scopeButtonTitles = ["Search", "Swift", "Jungle", "Rhye"]
  
  private let searchService = SearchService()
  
  private var searchedSongs: Songs? {
    didSet {
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
  private var musicPlayer: AVPlayer?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureSearchController()
    configureTableView()
    definesPresentationContext = true
  }
  
  private func configureSearchController() {
    navigationItem.searchController = searchController
    searchController.searchBar.tintColor = .systemPink
    searchController.obscuresBackgroundDuringPresentation = false
    searchController.searchBar.delegate = self
    searchController.searchBar.scopeButtonTitles = scopeButtonTitles
    searchController.searchBar.showsScopeBar = true
    navigationItem.hidesSearchBarWhenScrolling = false
//    searchController.searchBar.showsCancelButton = false
  }
  
  private func configureTableView() {
    
  }
  
}

extension ViewController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//    let term = searchBar.text ?? ""
    guard let term = searchBar.text else { return }
    searchService.searchSongs(by: term) { [weak self] result in
      switch result {
      case .success(let value):
        self?.searchedSongs = value
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
  
  func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
    guard selectedScope != 0 else { return }
    searchBar.text = scopeButtonTitles[selectedScope]
    let term = searchBar.text ?? ""
    searchService.searchSongs(by: term) { [weak self] result in
      switch result {
      case .success(let value):
        self?.searchedSongs = value
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    searchedSongs?.results.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath)
    let song = searchedSongs?.results[indexPath.row]
    
    cell.textLabel?.text = song?.trackName
    cell.detailTextLabel?.text = song?.artistName
    
    DispatchQueue.global().async {
      let albumPhotoURL = URL(string: song!.artworkURL100)!
      let albumData = try? Data(contentsOf: albumPhotoURL)
      DispatchQueue.main.async {
        cell.imageView?.image = UIImage(data: albumData!)
      }
    }
    
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let previewURL = URL(string: searchedSongs!.results[indexPath.row].previewURL)!
    musicPlayer?.pause()
    
    musicPlayer = AVPlayer(url: previewURL)
    musicPlayer?.play()
  }
  
  func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    
  }
}
