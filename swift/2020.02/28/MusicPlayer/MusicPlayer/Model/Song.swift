//
//  Song.swift
//  MusicPlayer
//
//  Created by Soohan Lee on 2020/02/28.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let searchedSong = try? newJSONDecoder().decode(SearchedSong.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.searchedSongTask(with: url) { searchedSong, response, error in
//     if let searchedSong = searchedSong {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Songs
struct Songs: Decodable {
  let results: [Song]
  
  // MARK: - Song
  struct Song: Decodable {
    let artistName, trackName, previewURL, artworkURL100: String
    
    enum CodingKeys: String, CodingKey {
      case artistName, trackName
      case artworkURL100 = "artworkUrl100"
      case previewURL = "previewUrl"
    }
  }
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

