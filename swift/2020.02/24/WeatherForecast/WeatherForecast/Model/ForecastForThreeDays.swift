//
//  ForecastForThreeDays.swift
//  WeatherForecast
//
//  Created by Soohan Lee on 2020/02/24.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let forecastForThreeDays = try? newJSONDecoder().decode(ForecastForThreeDays.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.forecastForThreeDaysTask(with: url) { forecastForThreeDays, response, error in
//     if let forecastForThreeDays = forecastForThreeDays {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - ForecastForThreeDays
struct ForecastForThreeDays: Codable {
    let weather: Weather
}


// MARK: - Weather
struct Weather: Codable {
    let forecast3Days: [Forecast3Day]

    enum CodingKeys: String, CodingKey {
        case forecast3Days = "forecast3days"
    }
}

// MARK: - Forecast3Day
struct Forecast3Day: Codable {
    let grid: Grid
    let fcst3Hour: Fcst3Hour
    let timeRelease: String
    let fcst6Hour: Fcst6Hour
    let fcstdaily: Fcstdaily

    enum CodingKeys: String, CodingKey {
        case grid
        case fcst3Hour = "fcst3hour"
        case timeRelease
        case fcst6Hour = "fcst6hour"
        case fcstdaily
    }
}

// MARK: - Fcst3Hour
struct Fcst3Hour: Codable {
    let sky: Sky
    let temperature: Fcst3HourTemperature
}



// Sky.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let sky = try? newJSONDecoder().decode(Sky.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.skyTask(with: url) { sky, response, error in
//     if let sky = sky {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Sky
struct Sky: Codable {
    let code4Hour, name4Hour, code7Hour, name7Hour: String
    let code10Hour, name10Hour, code13Hour, name13Hour: String
    let code16Hour, name16Hour, code19Hour, name19Hour: String
    let code22Hour, name22Hour, code25Hour, name25Hour: String
    let code28Hour, name28Hour, code31Hour, name31Hour: String
    let code34Hour, name34Hour, code37Hour, name37Hour: String
    let code40Hour, name40Hour, code43Hour, name43Hour: String
    let code46Hour, name46Hour, code49Hour, name49Hour: String
    let code52Hour, name52Hour, code55Hour, name55Hour: String
    let code58Hour, name58Hour, code61Hour, name61Hour: String
    let code64Hour, name64Hour, code67Hour, name67Hour: String

    enum CodingKeys: String, CodingKey {
        case code4Hour = "code4hour"
        case name4Hour = "name4hour"
        case code7Hour = "code7hour"
        case name7Hour = "name7hour"
        case code10Hour = "code10hour"
        case name10Hour = "name10hour"
        case code13Hour = "code13hour"
        case name13Hour = "name13hour"
        case code16Hour = "code16hour"
        case name16Hour = "name16hour"
        case code19Hour = "code19hour"
        case name19Hour = "name19hour"
        case code22Hour = "code22hour"
        case name22Hour = "name22hour"
        case code25Hour = "code25hour"
        case name25Hour = "name25hour"
        case code28Hour = "code28hour"
        case name28Hour = "name28hour"
        case code31Hour = "code31hour"
        case name31Hour = "name31hour"
        case code34Hour = "code34hour"
        case name34Hour = "name34hour"
        case code37Hour = "code37hour"
        case name37Hour = "name37hour"
        case code40Hour = "code40hour"
        case name40Hour = "name40hour"
        case code43Hour = "code43hour"
        case name43Hour = "name43hour"
        case code46Hour = "code46hour"
        case name46Hour = "name46hour"
        case code49Hour = "code49hour"
        case name49Hour = "name49hour"
        case code52Hour = "code52hour"
        case name52Hour = "name52hour"
        case code55Hour = "code55hour"
        case name55Hour = "name55hour"
        case code58Hour = "code58hour"
        case name58Hour = "name58hour"
        case code61Hour = "code61hour"
        case name61Hour = "name61hour"
        case code64Hour = "code64hour"
        case name64Hour = "name64hour"
        case code67Hour = "code67hour"
        case name67Hour = "name67hour"
    }
}

// MARK: - Fcst3HourTemperature
struct Fcst3HourTemperature: Codable {
    let temp4Hour, temp7Hour, temp10Hour, temp13Hour: String
    let temp16Hour, temp19Hour, temp22Hour, temp25Hour: String
    let temp28Hour, temp31Hour, temp34Hour, temp37Hour: String
    let temp40Hour, temp43Hour, temp46Hour, temp49Hour: String
    let temp52Hour, temp55Hour, temp58Hour, temp61Hour: String
    let temp64Hour, temp67Hour: String

    enum CodingKeys: String, CodingKey {
        case temp4Hour = "temp4hour"
        case temp7Hour = "temp7hour"
        case temp10Hour = "temp10hour"
        case temp13Hour = "temp13hour"
        case temp16Hour = "temp16hour"
        case temp19Hour = "temp19hour"
        case temp22Hour = "temp22hour"
        case temp25Hour = "temp25hour"
        case temp28Hour = "temp28hour"
        case temp31Hour = "temp31hour"
        case temp34Hour = "temp34hour"
        case temp37Hour = "temp37hour"
        case temp40Hour = "temp40hour"
        case temp43Hour = "temp43hour"
        case temp46Hour = "temp46hour"
        case temp49Hour = "temp49hour"
        case temp52Hour = "temp52hour"
        case temp55Hour = "temp55hour"
        case temp58Hour = "temp58hour"
        case temp61Hour = "temp61hour"
        case temp64Hour = "temp64hour"
        case temp67Hour = "temp67hour"
    }
}


// MARK: - Fcst6Hour
struct Fcst6Hour: Codable {
    let rain6Hour, rain12Hour, rain18Hour, rain24Hour: String
    let rain30Hour, rain36Hour, rain42Hour, rain48Hour: String
    let rain54Hour, snow6Hour, snow12Hour, snow18Hour: String
    let snow24Hour, snow30Hour, snow36Hour, snow42Hour: String
    let snow48Hour, snow54Hour, rain60Hour, rain66Hour: String
    let snow60Hour, snow66Hour: String

    enum CodingKeys: String, CodingKey {
        case rain6Hour = "rain6hour"
        case rain12Hour = "rain12hour"
        case rain18Hour = "rain18hour"
        case rain24Hour = "rain24hour"
        case rain30Hour = "rain30hour"
        case rain36Hour = "rain36hour"
        case rain42Hour = "rain42hour"
        case rain48Hour = "rain48hour"
        case rain54Hour = "rain54hour"
        case snow6Hour = "snow6hour"
        case snow12Hour = "snow12hour"
        case snow18Hour = "snow18hour"
        case snow24Hour = "snow24hour"
        case snow30Hour = "snow30hour"
        case snow36Hour = "snow36hour"
        case snow42Hour = "snow42hour"
        case snow48Hour = "snow48hour"
        case snow54Hour = "snow54hour"
        case rain60Hour = "rain60hour"
        case rain66Hour = "rain66hour"
        case snow60Hour = "snow60hour"
        case snow66Hour = "snow66hour"
    }
}

// Fcstdaily.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let fcstdaily = try? newJSONDecoder().decode(Fcstdaily.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.fcstdailyTask(with: url) { fcstdaily, response, error in
//     if let fcstdaily = fcstdaily {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Fcstdaily
struct Fcstdaily: Codable {
    let temperature: FcstdailyTemperature
}

// FcstdailyTemperature.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let fcstdailyTemperature = try? newJSONDecoder().decode(FcstdailyTemperature.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.fcstdailyTemperatureTask(with: url) { fcstdailyTemperature, response, error in
//     if let fcstdailyTemperature = fcstdailyTemperature {
//       ...
//     }
//   }
//   task.resume()

// MARK: - FcstdailyTemperature
struct FcstdailyTemperature: Codable {
    let tmax1Day, tmax2Day, tmax3Day, tmin1Day: String
    let tmin2Day, tmin3Day: String

    enum CodingKeys: String, CodingKey {
        case tmax1Day = "tmax1day"
        case tmax2Day = "tmax2day"
        case tmax3Day = "tmax3day"
        case tmin1Day = "tmin1day"
        case tmin2Day = "tmin2day"
        case tmin3Day = "tmin3day"
    }
}

// Grid.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let grid = try? newJSONDecoder().decode(Grid.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.gridTask(with: url) { grid, response, error in
//     if let grid = grid {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Grid
struct Grid: Codable {
    let latitude, longitude, city, county: String
    let village: String
}

// JSONSchemaSupport.swift

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
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

    func forecastForThreeDaysTask(with url: URL, completionHandler: @escaping (ForecastForThreeDays?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}
