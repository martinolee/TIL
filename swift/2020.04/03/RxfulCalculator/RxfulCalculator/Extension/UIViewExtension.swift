//
//  UIViewExtension.swift
//  RxfulCalculator
//
//  Created by Soohan Lee on 2020/04/03.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

import UIKit

extension UIView {
  func addSubViews(_ views: [UIView]) {
    views.forEach { addSubview($0) }
  }
}
