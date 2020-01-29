//
//  BasicStoryboardViewController.swift
//  CollectionViewExample
//
//  Created by giftbot on 2020/01/24.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class BasicStoryboardViewController: UIViewController {

  @IBOutlet private weak var collectionView: UICollectionView!
  
  let parkImages = ParkManager.imageNames(of: .nationalPark)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.dataSource = self
  }
  
}

extension BasicStoryboardViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return parkImages.count * 3
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BasicCell", for: indexPath)
    
    cell.backgroundColor = .systemPurple
    cell.layer.masksToBounds = true
    cell.layer.cornerRadius = cell.frame.width / 2
    
    guard let imageView = cell.contentView.subviews.first as? UIImageView else {
      return cell
    }
    
    imageView.image = UIImage(named: parkImages[indexPath.item % parkImages.count])
    
    return cell
  }
}
