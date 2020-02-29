//
//  SearchService.swift
//  MusicPlayer
//
//  Created by Soohan Lee on 2020/02/28.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

import Foundation

class SearchService {
  private let baseURL = "https://itunes.apple.com"
  
  func searchSongs(by term: String, completionHandler: @escaping (Result<Songs, ServiceError>) -> Void) {
    var searchURLComponents = URLComponents(string: baseURL)
    searchURLComponents?.path = "/search"
    
    searchURLComponents?.queryItems = [
      URLQueryItem(name: "media", value: "music"),
      URLQueryItem(name: "entity", value: "song"),
      URLQueryItem(name: "country", value: "US"),
      URLQueryItem(name: "term", value: term),
    ]
    
    guard let searchURL = searchURLComponents?.url else { return }
    
    let task = URLSession.shared.dataTask(with: searchURL) { data, response, error in
      guard error == nil else { return completionHandler(.failure(.clientError)) }
      guard let header = response as? HTTPURLResponse,
        (200..<300) ~= header.statusCode
        else { return }
      guard let data = data else { return completionHandler(.failure(.noData)) }
      
      if let searchedSongs = try? JSONDecoder().decode(Songs.self, from: data) {
        completionHandler(.success(searchedSongs))
      } else {
        completionHandler(.failure(.invalidFormat))
      }
    }
    
    task.resume()
  }
}
