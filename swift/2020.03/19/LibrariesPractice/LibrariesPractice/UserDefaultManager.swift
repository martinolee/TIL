//
//  UserDefaultManager.swift
//  LibrariesPractice
//
//  Created by Soohan Lee on 2020/03/19.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

import Foundation
import Alamofire

class UserDefaultManager {
  static let shared = UserDefaultManager()
  
  private init() { }
  
  @discardableResult func set<T>(_ value: T, forKey defaultName: String) -> Bool {
    UserDefaults.standard.set(value, forKey: defaultName)
    UserDefaults.standard.synchronize()
    
    guard UserDefaults.standard.object(forKey: defaultName) != nil else { return false }
    return true
  }
  
  func get(forKey defaultName: String) -> Any? {
    UserDefaults.standard.object(forKey: defaultName)
  }
}
