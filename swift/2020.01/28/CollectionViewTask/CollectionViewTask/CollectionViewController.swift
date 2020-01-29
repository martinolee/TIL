//
//  CollectionViewController.swift
//  CollectionViewTask
//
//  Created by Soohan Lee on 2020/01/28.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
  
  private let cats = ["cat0", "cat1", "cat2", "cat3", "cat4", "cat5", "cat6", "cat7", "cat8", "cat9"]
  private lazy var shownCats = cats + cats
  private lazy var selectedCats = Array.init(repeating: false, count: shownCats.count)
  
  private lazy var catCollectionViewFlowLayout = UICollectionViewFlowLayout()
  
  private lazy var catCollectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: catCollectionViewFlowLayout)
    
    collectionView.dataSource = self
    collectionView.delegate = self
    
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    collectionView.register(CatCollectionViewCell.self, forCellWithReuseIdentifier: CatCollectionViewCell.identifier)
    
    collectionView.backgroundColor = .systemBackground
    collectionView.allowsMultipleSelection = true
    
    return collectionView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Cats"
    view.backgroundColor = .systemBackground
    view.addSubview(catCollectionView)
    setupFlowLayout()
    setupRemoveCatPhotoButton()
  }
  
  private func setupRemoveCatPhotoButton() {
    let removeButton = UIButton(type: .system)
    let trashImage = UIImage(systemName: "trash")
    removeButton.setImage(trashImage, for: .normal)
    removeButton.addTarget(self, action: #selector(removeCatPhoto(_:)), for: .touchUpInside)
    
    let barButton = UIBarButtonItem(customView: removeButton)
    
    navigationItem.rightBarButtonItem = barButton
  }
  
  private func setupFlowLayout() {
    let fourSidesInset: CGFloat = 8.0
    let minimumLineSpacing: CGFloat = 8.0
    let minimumInteritemSpacing: CGFloat = 8.0
    let itemsForLine: CGFloat = 2
    let itemSizeWidth = (catCollectionView.frame.width - (fourSidesInset * 2 + minimumInteritemSpacing * (itemsForLine - 1))) / itemsForLine
    let itemSize = CGSize(width: itemSizeWidth, height: itemSizeWidth)
    
    catCollectionViewFlowLayout.sectionInset = UIEdgeInsets(
      top: fourSidesInset,
      left: fourSidesInset,
      bottom: fourSidesInset,
      right: fourSidesInset)
    catCollectionViewFlowLayout.minimumLineSpacing = minimumLineSpacing
    catCollectionViewFlowLayout.minimumInteritemSpacing = minimumInteritemSpacing
    catCollectionViewFlowLayout.itemSize = itemSize
    catCollectionViewFlowLayout.scrollDirection = .vertical
  }
  
  @objc
  private func removeCatPhoto(_ sender: UIBarButtonItem) {    
    for i in (0 ..< selectedCats.count).reversed() {
      if selectedCats[i] {
        selectedCats.remove(at: i)
        shownCats.remove(at: i)
        
        if shownCats.isEmpty {
          shownCats = cats + cats
          selectedCats = Array.init(repeating: false, count: shownCats.count)
          catCollectionView.reloadData()
          return
        }
      }
    }
    
    catCollectionView.reloadData()
  }
}

extension CollectionViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    shownCats.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: CatCollectionViewCell.identifier,
      for: indexPath
      ) as! CatCollectionViewCell
    
    cell.catImageView.image = UIImage(named: shownCats[indexPath.item % shownCats.count])
    
    if selectedCats[indexPath.item] {
      cell.isChecked = true
    } else {
      cell.isChecked = false
    }
    
    return cell
  }
  
}

extension CollectionViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let cell = collectionView.cellForItem(at: indexPath) as! CatCollectionViewCell
    
    cell.isChecked = true
    selectedCats[indexPath.item] = true
  }
  
  func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    let cell = collectionView.cellForItem(at: indexPath) as! CatCollectionViewCell
    
    cell.isChecked = false
    selectedCats[indexPath.item] = false
  }
  
  func collectionView(_ collectionView: UICollectionView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool {
    true
  }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    
    let cell = cell as! CatCollectionViewCell
    
    cell.alpha = 0
    cell.transform = .init(scaleX: 0.3, y: 0.3)
    
    UIView.animate(withDuration: 0.25) {
      cell.alpha = 1
      cell.transform = .identity
    }
  }
}
