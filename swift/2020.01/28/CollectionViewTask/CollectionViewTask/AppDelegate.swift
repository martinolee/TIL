//
//  AppDelegate.swift
//  CollectionViewTask
//
//  Created by Soohan Lee on 2020/01/28.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    
    let rootViewController = UINavigationController(rootViewController: CollectionViewController())
    
    window?.rootViewController = rootViewController
    window?.makeKeyAndVisible()
    
    return true
  }
  
  
}

