//
//  SectionHeaderView.swift
//  CollectionViewExercises
//
//  Created by Giftbot on 2020/01/28.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
  static let identifier = "SectionHeaderView"
  private let titleLabel = UILabel()
  private let blurView = UIVisualEffectView()
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  
  private func setupView() {
    let blurEffect = UIBlurEffect(style: .systemMaterialDark)
    blurView.effect = blurEffect
    addSubview(blurView)
    
    titleLabel.textColor = .label
    titleLabel.textAlignment = .center
    titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
    addSubview(titleLabel)
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    blurView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      blurView.topAnchor.constraint(equalTo: topAnchor),
      blurView.leadingAnchor.constraint(equalTo: leadingAnchor),
      blurView.trailingAnchor.constraint(equalTo: trailingAnchor),
      blurView.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
    ])
  }
  
  
  // MARK: Configure
  
  func configure(title: String) {
    titleLabel.text = title
  }
}
