//
//  CurrentWeatherCell.swift
//  WeatherForecast
//
//  Created by Soohan Lee on 2020/02/24.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

import UIKit

class CurrentWeatherCell: UITableViewCell {
  // MARK: - Properties
  
  static let identifier = "CurrentWeatherCell"
  
  // MARK: - Initialization
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureCell() {
    self.backgroundColor = .clear
  }
}
