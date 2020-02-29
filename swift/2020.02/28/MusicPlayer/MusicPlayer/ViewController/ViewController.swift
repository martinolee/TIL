//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Soohan Lee on 2020/02/28.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var indicatorView: UIActivityIndicatorView!
  
  private let searchController = UISearchController(searchResultsController: nil)
  
  private let scopeButtonTitles = ["Search", "Swift", "Jungle", "Rhye"]
  
  private let searchService = SearchService()
  
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
    let term = searchBar.text ?? ""
    searchService.searchSongs(by: term) {
      print($0)
    }
  }
  
  func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
    guard selectedScope != 0 else { return }
    searchBar.text = scopeButtonTitles[selectedScope]
  }
}
