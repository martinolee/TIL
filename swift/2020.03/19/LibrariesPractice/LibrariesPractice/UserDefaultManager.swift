//
//  UserDefaultManager.swift
//  LibrariesPractice
//
//  Created by Soohan Lee on 2020/03/19.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

import Foundation

class UserDefaultManager {
  enum Key: String {
    case token, cart
  }
  
  static let shared = UserDefaultManager()
  
  private init() { }
  
  @discardableResult func set<T>(_ value: T, for key: Key) -> Bool {
    UserDefaults.standard.set(value, forKey: key.rawValue)
    UserDefaults.standard.synchronize()
    
    guard UserDefaults.standard.object(forKey: key.rawValue) != nil else { return false }
    return true
  }
  
  func get(for key: Key) -> Any? {
    UserDefaults.standard.object(forKey: key.rawValue)
  }
}
