//
//  CurrentForecast.swift
//  WeatherForecast
//
//  Created by Soohan Lee on 2020/02/24.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

import Foundation

//   let currentWeather = try? newJSONDecoder().decode(CurrentWeather.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.purpleDataTask(with: url) { currentWeather, response, error in
//     if let currentWeather = currentWeather {
//       ...
//     }
//   }
//   task.resume()

// MARK: - CurrentWeather
struct CurrentWeather: Codable {
  let weather: Weather
  
  struct Weather: Codable {
    private let minutely: [Minutely]
    var info: Minutely {
      get { minutely.first! }
    }
    
    struct Minutely: Codable {
      let sky: Sky
      let temperature: Temperature
      
      struct Sky: Codable {
        let code, name: String
      }
      
      struct Temperature: Codable {
        let currentTemperature, highestTemperature, lowestTemperature: String
        
        private enum CodingKeys: String, CodingKey {
          case currentTemperature = "tc"
          case highestTemperature = "tmax"
          case lowestTemperature = "tmin"
        }
      }
    }
  }
}

// MARK: - URLSession response handlers

extension URLSession {
  fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
    return self.dataTask(with: url) { data, response, error in
      guard let data = data, error == nil else {
        completionHandler(nil, response, error)
        return
      }
      completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
    }
  }
  
  func currentWeatherTask(with url: URL, completionHandler: @escaping (CurrentWeather?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
    return self.codableTask(with: url, completionHandler: completionHandler)
  }
}
