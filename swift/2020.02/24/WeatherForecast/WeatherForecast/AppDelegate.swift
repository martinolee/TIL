//
//  AppDelegate.swift
//  WeatherForecast
//
//  Created by Soohan Lee on 2020/02/24.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    setupRootViewController()
//    ServiceManager.shared.getCurrentWeather(lon: "127.0572766", lat: "37.5450239") {
//      print($0)
//    }
//
//    ServiceManager.shared.getForecastForThreeDays(lon: "127.0572766", lat: "37.5450239") {
//      print($0)
//    }
    
    return true
  }
  
  private func setupRootViewController() {
    window = UIWindow(frame: UIScreen.main.bounds)
    
    let rootViewController = UINavigationController(rootViewController: ForecastViewController())
    
    window?.rootViewController = rootViewController
    window?.makeKeyAndVisible()
  }

}
