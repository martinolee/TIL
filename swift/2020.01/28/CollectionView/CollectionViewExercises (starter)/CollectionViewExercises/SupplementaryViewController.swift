//
//  SupplementaryViewController.swift
//  CollectionViewExercises
//
//  Created by Giftbot on 2020/01/28.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

final class SupplementaryViewController: UIViewController {
  
  var dataSource: [Section] = sections
  
  private let flowLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    
    layout.minimumLineSpacing = 4
    layout.minimumInteritemSpacing = 4
    layout.sectionInset = UIEdgeInsets(top: 25, left: 5, bottom: 25, right: 5)
    layout.itemSize = CGSize(width: 50, height: 50)
    layout.headerReferenceSize = CGSize(width: 50, height: 50)
    layout.footerReferenceSize = CGSize(width: 3, height: 3)
    
    layout.sectionHeadersPinToVisibleBounds = true
    layout.sectionFootersPinToVisibleBounds = false
    
    return layout
  }()
  
  private lazy var collectionView: UICollectionView = {
    let collectionView = UICollectionView(
      frame: view.frame,
      collectionViewLayout: flowLayout
    )
    
    collectionView.register(
      SectionHeaderView.self,
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
      withReuseIdentifier: SectionHeaderView.identifier
    )
    collectionView.register(
      UICollectionReusableView.self,
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
      withReuseIdentifier: "FooterView"
    )
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CardCell")
    
    collectionView.dataSource = self
    
    return collectionView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBackground
    view.addSubview(collectionView)
  }
}


// MARK: - UICollectionViewDataSource

extension SupplementaryViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    dataSource.count
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    dataSource[section].cards.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath)
    
    cell.backgroundColor = dataSource[indexPath.section].cards[indexPath.item].color
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    if kind == UICollectionView.elementKindSectionHeader {
      let header = collectionView.dequeueReusableSupplementaryView(
        ofKind: kind,
        withReuseIdentifier: SectionHeaderView.identifier,
        for: indexPath
      ) as! SectionHeaderView
      
      let title = "Section - \(indexPath.section)"
      
      header.configure(title: title)
      
      return header
    } else {
      let footer = collectionView.dequeueReusableSupplementaryView(
        ofKind: kind,
        withReuseIdentifier: "FooterView",
        for: indexPath
      )
      
      footer.backgroundColor = .systemGray
      
      return footer
    }
  }
}
