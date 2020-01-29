//
//  BasicViewController.swift
//  CollectionViewExercises
//
//  Created by Giftbot on 2020/01/28.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

final class BasicViewController: UIViewController {
  
  let dataSource = cards
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupCollectionView()
  }
  
  private func setupCollectionView() {
    let layout = UICollectionViewFlowLayout()
    let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
    
    let layoutLeftInset: CGFloat = 8.0
    let layoutRightInset: CGFloat = 8.0
    let layoutMinimumLineSpacing: CGFloat = 4.0
    let layoutMinimumInteritemSpacing: CGFloat = 4.0
    
    collectionView.dataSource = self
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CardCell")
    
    layout.sectionInset = UIEdgeInsets(top: 8, left: layoutLeftInset, bottom: 8, right: layoutRightInset)
    layout.minimumLineSpacing = layoutMinimumLineSpacing
    layout.minimumInteritemSpacing = layoutMinimumInteritemSpacing
    layout.itemSize = CGSize(width: 80, height: 160)
    
    view.addSubview(collectionView)
  }
  
}

// MARK: - UICollectionViewDataSource

extension BasicViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 100
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath)
    
    cell.backgroundColor = dataSource[indexPath.item % dataSource.count].color
    print("indexPath.row: \(indexPath.row), indexPath.item: \(indexPath.item), indexPath.item % dataSource.count: \(indexPath.item % dataSource.count)")
    return cell
  }
}
