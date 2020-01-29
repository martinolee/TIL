//
//  CatCollectionViewCell.swift
//  CollectionViewTask
//
//  Created by Soohan Lee on 2020/01/28.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

import UIKit

class CatCollectionViewCell: UICollectionViewCell {
  static let identifier = "CatCell"
  
  var isChecked = false {
    didSet {
      dimView.isHidden = !isChecked
      checkmarkImageView.isHidden = !isChecked
    }
  }
  
  let catImageView: UIImageView = {
    let imageView = UIImageView()
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    
    return imageView
  }()
  
  lazy var dimView: UIView = {
    let view = UIView()
    
    view.translatesAutoresizingMaskIntoConstraints = false
    
    view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    view.isHidden = !isChecked
    
    return view
  }()
  
  lazy var checkmarkImageView: UIImageView = {
    let imageView = UIImageView()
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    
    imageView.image = UIImage(systemName: "checkmark.circle.fill")
    imageView.tintColor = .white
    imageView.isHidden = !isChecked
    
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.clipsToBounds = true
    self.layer.cornerRadius  = 8
    
    addSubview(catImageView)
    addSubview(dimView)
    addSubview(checkmarkImageView)
    setupAutoLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupAutoLayout() {
    NSLayoutConstraint.activate([
      catImageView.topAnchor.constraint(equalTo: self.topAnchor),
      catImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      catImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      catImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
    ])
    
    NSLayoutConstraint.activate([
      dimView.topAnchor.constraint(equalTo: catImageView.topAnchor),
      dimView.leadingAnchor.constraint(equalTo: catImageView.leadingAnchor),
      dimView.trailingAnchor.constraint(equalTo: catImageView.trailingAnchor),
      dimView.bottomAnchor.constraint(equalTo: catImageView.bottomAnchor),
    ])
    
    NSLayoutConstraint.activate([
      checkmarkImageView.widthAnchor.constraint(equalTo: catImageView.widthAnchor, multiplier: 1/4),
      checkmarkImageView.heightAnchor.constraint(equalTo: catImageView.heightAnchor, multiplier: 1/4),
      checkmarkImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
      checkmarkImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
    ])
  }
  
}
