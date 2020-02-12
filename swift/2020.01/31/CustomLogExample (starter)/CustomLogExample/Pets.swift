//
//  Pets.swift
//  CustomLogExample
//
//  Created by giftbot on 2020/01/30.
//  Copyright © 2020 giftbot. All rights reserved.
//

import Foundation

class Dog: NSObject {
  let name = "Tory"
  let age = 5
  let feature: [String: String] = [
    "breed": "Poodle",
    "tail": "short"
  ]
  
  override var description: String {
    "Dog's name: \(name), age: \(age)"
  }
  
  override var debugDescription: String {
    "Dog's name: \(name), age: \(age), feature: \(feature)"
  }
}

struct Cat {
  let name = "Lilly"
  let age = 2
  let feature: [String: String] = [
    "breed": "Koshort",
    "tail": "short"
  ]
}
