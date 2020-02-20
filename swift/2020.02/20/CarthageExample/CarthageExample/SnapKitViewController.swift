//
//  SnapKitViewController.swift
//  CarthageExample
//
//  Created by Soohan Lee on 2020/02/20.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

import UIKit
import SnapKit

final class SnapKitViewController: UIViewController {
  
  private let squareView = UIView()
  private let bottomCircleView = UIView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    snapKitExample()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    bottomCircleView.layer.cornerRadius = bottomCircleView.frame.width / 2
  }
  
  func snapKitExample() {
    squareView.backgroundColor = .green
    view.addSubview(squareView)
    
    let topView = UIView()
    
    topView.backgroundColor = .black
    squareView.addSubview(topView)
    
    let topLabel = UILabel()
    
    topLabel.text = "TopView"
    topLabel.textColor = .white
    topLabel.textAlignment = .center
    topLabel.font = UIFont.boldSystemFont(ofSize: 25)
    topView.addSubview(topLabel)
    
    let bottomView = UIView()
    
    bottomView.backgroundColor = .yellow
    squareView.addSubview(bottomView)
    
    let bottomLabel = UILabel()
    
    bottomLabel.text = "BottomView"
    bottomLabel.textAlignment = .center
    bottomLabel.font = UIFont.boldSystemFont(ofSize: 25)
    bottomView.addSubview(bottomLabel)
    bottomCircleView.backgroundColor = .cyan
    view.addSubview(bottomCircleView)
    
    // SnapKit
    
    squareView.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.centerY.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.7)
      $0.height.equalToSuperview().multipliedBy(0.4)
    }
    
    topView.snp.makeConstraints {
      $0.leading.trailing.top.equalToSuperview().inset(20)
    }
    
    bottomView.snp.makeConstraints {
      $0.top.equalTo(topView.snp.bottom)
      $0.height.equalTo(topView)
      $0.leading.bottom.trailing.equalToSuperview().inset(20)
    }
    
    topLabel.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    
    bottomLabel.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    
    bottomCircleView.snp.makeConstraints {
      $0.top.equalTo(squareView.snp.bottom)
      $0.centerX.equalTo(squareView)
      $0.size.equalTo(squareView.snp.width).dividedBy(2)
    }
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
      UIView.animate(withDuration: 1) {
        self.bottomCircleView.snp.updateConstraints {
          $0.top.equalTo(self.squareView.snp.bottom).offset(-450)
        }
        self.view.layoutIfNeeded()
      }
    }
  }
  
  
}
