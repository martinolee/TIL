//
//  Logger.swift
//  CustomLogExample
//
//  Created by giftbot on 2020/01/30.
//  Copyright © 2020 giftbot. All rights reserved.
//

import Foundation

class Formatter {
  static let date: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss:SS"
    return dateFormatter
  }()
}

func logger(
  _ contents: Any...,
  header: String = "",
  _ file: String = #file,
  _ function: String = #function,
  _ line: Int = #line
  ) {
  let emoji = "🔥"
  let timestamp = Formatter.date.string(from: Date())
  
  let fileURL = URL(fileURLWithPath: file)
  let fileName = fileURL.deletingPathExtension().lastPathComponent
  
  let header = header.isEmpty ? "" : " [ \(header) ] -"
  let content = contents.reduce("") { $0 + " " + String(describing: $1) }
  
  let combinedText = """
  \(emoji) \(timestamp) / \
  \(fileName) / \(function) (\(line)) \(emoji)\
  \(header)\(content)
  """
  
  print(combinedText)
}
