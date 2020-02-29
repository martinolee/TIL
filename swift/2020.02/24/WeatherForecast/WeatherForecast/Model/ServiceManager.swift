//
//  ServiceManager.swift
//  WeatherForecast
//
//  Created by Soohan Lee on 2020/02/24.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

import Foundation

class ServiceManager {
  static let shared = ServiceManager()
  
  private init() { }
  
  func getCurrentWeather(lon: String, lat: String, complicationHandler: @escaping (CurrentWeather) -> ()) {
    let currentWeatherURL = URL(string: "https://apis.openapi.sk.com/weather/current/minutely?lon=\(lon)&lat=\(lat)&appKey=\(APIKey.projectKey)")!
    let task = URLSession.shared.currentWeatherTask(with: currentWeatherURL) { (currentWeather, response, error) in
      if let currentWeather = currentWeather {
        complicationHandler(currentWeather)
      }
    }
    
    task.resume()
  }
  
  func getForecastForThreeDays(lon: String, lat: String, complicationHandler: @escaping (ForecastForThreeDays) -> ()) {
    let forecastForThreeDaysURL = URL(string: "https://apis.openapi.sk.com/weather/forecast/3days?lon=\(lon)&lat=\(lat)&appKey=\(APIKey.projectKey)")!
    
    let task = URLSession.shared.forecastForThreeDaysTask(with: forecastForThreeDaysURL) { (forecastForThreeDays, response, error) in
      if let forecastForThreeDays = forecastForThreeDays {
        complicationHandler(forecastForThreeDays)
      }
    }
    
    task.resume()
  }
  
//  func getForecastForThreeDays
  
}
