//
//  BasicCodeViewController.swift
//  CollectionViewExample
//
//  Created by giftbot on 2020/01/24.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class CustomCellViewController: UIViewController {
  
  let flowLayout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(
    frame: view.frame, collectionViewLayout: flowLayout
  )
  
  let itemCount = 120
  let parkImages = ParkManager.imageNames(of: .nationalPark)
  var showImage = false
  
  // MARK: LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupCollectionView()
    setupNavigationItem()
  }

  // MARK: Setup Views
  
  private func setupCollectionView() {
    setupFlowLayout()
    
    collectionView.backgroundColor = .systemBackground
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ColorCircle")
    collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
    view.addSubview(collectionView)
  }
  
  private func setupFlowLayout() {
    if showImage {
      flowLayout.itemSize = CGSize(width: 120, height: 120)
      flowLayout.minimumInteritemSpacing = 15
      flowLayout.minimumLineSpacing = 20
      flowLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    } else {
      flowLayout.itemSize = CGSize(width: 60, height: 60)
      flowLayout.minimumInteritemSpacing = 10
      flowLayout.minimumLineSpacing = 20
      flowLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
  }
  
  private func setupNavigationItem() {
    let changeItem = UIBarButtonItem(
      barButtonSystemItem: .refresh,
      target: self,
      action: #selector(changeCollectionViewItems(_:))
    )
    let changeDirection = UIBarButtonItem(
      barButtonSystemItem: .reply,
      target: self,
      action: #selector(changeCollectionViewDirection(_:))
    )
    navigationItem.rightBarButtonItems = [changeItem, changeDirection]
  }
  
  // MARK: Action
  
  @objc private func changeCollectionViewItems(_ sender: Any) {
    showImage.toggle()
    setupFlowLayout()
    collectionView.reloadData()
  }
  
  @objc private func changeCollectionViewDirection(_ sender: Any) {
    let direction = flowLayout.scrollDirection
    flowLayout.scrollDirection = direction == .horizontal ? .vertical : .horizontal
  }
  
  private func color(at indexPath: IndexPath) -> UIColor {
    let max = CGFloat(itemCount)
    let currentIndex = CGFloat(indexPath.item)
    
    let factor = 0.1 + (currentIndex / max) * 0.8
    if showImage {
      return UIColor(hue: factor, saturation: 1, brightness: 1, alpha: 1)
    } else {
      return UIColor(hue: factor, saturation: factor, brightness: 1, alpha: 1)
    }

  }
  
}

// MARK: - UICollectionViewDataSource

extension CustomCellViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return itemCount
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: UICollectionViewCell!
    if showImage {
      let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
      let item = indexPath.item % parkImages.count
      
      customCell.configure(image: UIImage(named: parkImages[item]), title: parkImages[item])
      cell = customCell
    } else {
      cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCircle", for: indexPath)
      cell.layer.cornerRadius = cell.frame.width / 2
    }
    
    cell.backgroundColor = color(at: indexPath)
    
    return cell
  }
}

extension CustomCellViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    cell.alpha = 0
    cell.transform = .init(scaleX: 0.3, y: 0.3)
    
    UIView.animate(withDuration: 0.25) {
      cell.alpha = 1
      cell.transform = .identity
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
    
    if indexPath.item % 5 == 2 {
      return flowLayout.itemSize.applying(.init(scaleX: 2.0, y: 2.0))
    } else {
      return flowLayout.itemSize
    }
  }
}
