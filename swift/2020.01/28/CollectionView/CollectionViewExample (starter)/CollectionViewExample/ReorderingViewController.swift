//
//  ReorderingViewController.swift
//  CollectionViewExample
//
//  Created by Giftbot on 2020/01/28.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class ReorderingViewController: UIViewController {

  let names = ParkManager.imageNames(of: .nationalPark)
  
  lazy var parkImages = names + names + names
  
  let layout = UICollectionViewFlowLayout()
  lazy var collectionView: UICollectionView = {
    let cv = UICollectionView(frame: view.frame, collectionViewLayout: layout)
    cv.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
    cv.dataSource = self
    cv.backgroundColor = .systemBackground
    view.addSubview(cv)
    return cv
  }()
  
  // MARK: - View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    setupFlowLayout()
    setupLongPressGestureRecognizer()
  }


  // MARK: Setup FlowLayout

  func setupFlowLayout() {
    let itemsInLine: CGFloat = 4
    let spacing: CGFloat = 10
    let insets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    let cvWidth = collectionView.bounds.width
    let contentSize = cvWidth - insets.left - insets.right - (spacing * (itemsInLine - 1))
    let itemSize = (contentSize / itemsInLine).rounded(.down)
    
    layout.minimumLineSpacing = spacing
    layout.minimumInteritemSpacing = spacing
    layout.sectionInset = insets
    layout.itemSize = CGSize(width: itemSize, height: itemSize)
  }

  // MARK: Setup Gesture
  
  func setupLongPressGestureRecognizer() {
    let gesture = UILongPressGestureRecognizer(
      target: self,
      action: #selector(reorderCollectionViewItem(_:))
    )
    
    collectionView.addGestureRecognizer(gesture)
  }
  
  
  // MARK: - Action

  @objc
  private func reorderCollectionViewItem(_ sender: UILongPressGestureRecognizer) {
    let location = sender.location(in: collectionView)
    switch sender.state {
    case .began:
      guard let indexPath = collectionView.indexPathForItem(at: location) else { return }
      collectionView.beginInteractiveMovementForItem(at: indexPath)
    case .changed:
      collectionView.updateInteractiveMovementTargetPosition(location)
    case .cancelled:
      collectionView.cancelInteractiveMovement()
    case .ended:
      collectionView.endInteractiveMovement()
    default:
      break
    }
  }
}

// MARK: - UICollectionViewDataSource

extension ReorderingViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return parkImages.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: CustomCell.identifier, for: indexPath
      ) as! CustomCell
    let item = indexPath.item
    cell.backgroundColor = .black
    cell.configure(image: UIImage(named: parkImages[item]), title: parkImages[item])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    guard sourceIndexPath != destinationIndexPath else { return }
    
    let source = sourceIndexPath.item
    let destination = destinationIndexPath.item
    print("source:", source, "dest :", destination)
    
    let element = parkImages.remove(at: source)
    parkImages.insert(element, at: destination)
  }
}
