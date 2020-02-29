//
//  ForecastView.swift
//  WeatherForecast
//
//  Created by Soohan Lee on 2020/02/24.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

import UIKit

class ForecastView: UIView {
  
  // MARK: - Properties
  
  private let backgroundImageView: UIImageView = {
    let imageView = UIImageView()
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    
    imageView.contentMode = .scaleAspectFit
    imageView.image = UIImage(named: "sunny")
    
    return imageView
  }()
  
  private lazy var forecastTableView: UITableView = {
    let tableView = UITableView()
    
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    tableView.dataSource = self
    
    tableView.register(CurrentWeatherCell.self, forCellReuseIdentifier: CurrentWeatherCell.identifier)
    tableView.register(ForecastForThreeDaysCell.self, forCellReuseIdentifier: ForecastForThreeDaysCell.identifier)
    
    tableView.backgroundColor = .clear
    tableView.separatorStyle = .none
    
    return tableView
  }()
  
  // MARK: - Initializtion
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addAllView()
    setupForecastTableViewAutoLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Configuration
  
  private func configureView() {
    self.backgroundColor = .systemBackground
  }
  
  // MARK: - Setup UI
  
  private func addAllView() {
    self.addSubview(backgroundImageView)
    self.addSubview(forecastTableView)
  }
  
  private func setupForecastTableViewAutoLayout() {
    NSLayoutConstraint.activate([
      forecastTableView.topAnchor     .constraint(equalTo: self.topAnchor),
      forecastTableView.leadingAnchor .constraint(equalTo: self.leadingAnchor),
      forecastTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      forecastTableView.bottomAnchor  .constraint(equalTo: self.bottomAnchor),
    ])
  }
  
  private func setupBackgroundImageViewAutoLayout() {
    NSLayoutConstraint.activate([
      backgroundImageView.topAnchor     .constraint(equalTo: forecastTableView.topAnchor),
      backgroundImageView.leadingAnchor .constraint(equalTo: forecastTableView.leadingAnchor),
      backgroundImageView.trailingAnchor.constraint(equalTo: forecastTableView.trailingAnchor),
      backgroundImageView.bottomAnchor  .constraint(equalTo: forecastTableView.bottomAnchor),
    ])
  }
}

extension ForecastView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    
    cell.backgroundColor = .clear
    
    return cell
  }
  
  
}
