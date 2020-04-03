//
//  CalculatingModel.swift
//  RxfulCalculator
//
//  Created by Soohan Lee on 2020/04/03.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

import Foundation

class CalculatingModel {
  var lhs: Int?
  var rhs: Int?
  
  var result: Int? {
    guard
      let lhs = lhs,
      let rhs = rhs
    else { return nil }
    
    return lhs + rhs
  }
}
