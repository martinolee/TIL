//
//  ForecastViewController.swift
//  WeatherForecast
//
//  Created by Soohan Lee on 2020/02/24.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {
  // MARK: - Properties
  
  private let forecastView = ForecastView()
  
  // MARK: - Life Cycle
  
  override func loadView() {
    view = forecastView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    clearNavigationBackground()
    title = "Hello World..!"
  }
  
  private func clearNavigationBackground() {
    // Clear UINavigationBar
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    self.navigationController?.navigationBar.shadowImage = UIImage()

    // Clear UITabBar
    self.tabBarController?.tabBar.shadowImage = UIImage()
    self.tabBarController?.tabBar.backgroundImage = UIImage()
  }
  
  // MARK: - Initialization
  
}


