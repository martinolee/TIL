//
//  ViewController.swift
//  URLSessionExample
//
//  Created by giftbot on 2020. 2. 12..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView!
  private let imageUrlStr = "https://loremflickr.com/860/640/cat"
  
  
  // MARK: - Sync method
  
  @IBAction private func syncMethod() {
    print("\n---------- [ syncMethod ] ----------\n")
    
    let url = URL(string: imageUrlStr)!
    
//    DispatchQueue.global().async {
//      if let data = try? Data(contentsOf: url) {
//        DispatchQueue.main.async {
//          self.imageView.image = UIImage(data: data)
//        }
//      }
//    }
    
    URLSession.shared.dataTask(with: url) { (data, a, b) in
      if let data = data {
        DispatchQueue.main.async {
          self.imageView.image = UIImage(data: data)
        }
      }
    }.resume()
  }
  
  
  // MARK: - URLComponents
  
  @IBAction private func urlComponentsExample(_ sender: Any) {
    print("\n---------- [ urlComponentsExample ] ----------\n")
    /*
     http://username:password@www.example.com:80/index.html?key1=value1&key2=value2#myFragment
     */
    // 위 URL 구성을 보고 URLComponents의 각 파트를 수정해 위 구성과 같도록 만들어보기
    
    var components = URLComponents()
    
    components.scheme = "http"
    print(components)
    components.user = "username"
    print(components)
    components.password = "password"
    print(components)
    components.host = "www.example.com"
    print(components)
    components.port = 80
    print(components)
    components.path = "/index.html"    // path는 /로 시작해야 함
    print(components)
    
    components.query = "key1=value1&key2=value2"
    print(components)
    components.fragment = "myFragment"
    print(components)
    components.queryItems = [
      URLQueryItem(name: "name", value: "steve jobs"),
      URLQueryItem(name: "company", value: "apple"),
      URLQueryItem(name: "address", value: "california"),
    ]
    print(components)
  }
  
  
  
  // MARK: - URL Encoding Example
  
  @IBAction private func urlEncodingExample() {
    print("\n---------- [ urlEncodingExample ] ----------\n")
    
    let englishURLStr = "https://search.naver.com/search.naver?query=swift"
    let koreanURLStr = "https://search.naver.com/search.naver?query=한글"
    let encodedKoreanURLStr = koreanURLStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    
    print("englishURLStr:", URL(string: englishURLStr) ?? "nil")
    print("koreanURLStr:", URL(string: koreanURLStr) ?? "nil")
    print("encodedKoreanURLStr:", URL(string: encodedKoreanURLStr) ?? "nil")
    
    let originalString = "color-#708090"
    
    var allowed = CharacterSet.urlFragmentAllowed
    allowed.insert("#")
    
    let encodedString = originalString.addingPercentEncoding(withAllowedCharacters: allowed)!
    print(encodedString)
  }
  
  
  
  // MARK: - Session Configuration
  
  @IBAction private func sessionConfig(_ sender: Any) {
    print("\n---------- [ Session Configuration ] ----------\n")
    
    _ = URLSessionConfiguration.default
    _ = URLSessionConfiguration.ephemeral
    _ = URLSessionConfiguration.background(withIdentifier: "com.soohan.example.background")
    
    let sessionConfig = URLSessionConfiguration.default
    
    sessionConfig.allowsCellularAccess          = false                         // default value: true
    sessionConfig.httpMaximumConnectionsPerHost = 5                             // default value: 4
    sessionConfig.timeoutIntervalForRequest     = 20                            // default value: 60
    sessionConfig.requestCachePolicy            = .reloadIgnoringLocalCacheData // default value: .useProtocolCachePlicy
    sessionConfig.waitsForConnectivity          = true                          // default value: false
    
    // default cache URLCache.shared
    // memory - 16 KB  = 16  * 1024
    // disk   - 256 MB = 256 * 1014
    
    let myCache = URLCache(memoryCapacity: 16_384, diskCapacity: 268_435_456, diskPath: nil)
    sessionConfig.urlCache = myCache
    
    let cache = URLCache.shared
    sessionConfig.urlCache = cache
    
    print(cache.memoryCapacity)
    print(cache.currentMemoryUsage)
    print(cache.diskCapacity)
    print(cache.currentDiskUsage)
    
    // (user home directory)/Library/Caches/(application bundle id)/
    
    cache.removeAllCachedResponses()
    
    let mySession = URLSession.init(configuration: sessionConfig)
    let url = URL(string: imageUrlStr)!
    
    let task = mySession.dataTask(with: url) { [weak self] (data, response, error) in
      guard let data = data else { return }
      
      DispatchQueue.main.async {
        self?.imageView.image = UIImage(data: data)!
        print("download completed")
      }
    }
    task.resume()
  }
  

  // MARK: - Get, Post, Delete
  
  // https://jsonplaceholder.typicode.com/
  
  @IBAction func requestGet(_ sender: Any) {
    print("\n---------- [ Get Method ] ----------\n")
    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos/1"
    
    guard let url = URL(string: todoEndpoint) else { return }
    
    let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
      guard error == nil else { return print(error!.localizedDescription) }
      guard
        let response = response as? HTTPURLResponse,
        (200..<300).contains(response.statusCode),
        response.mimeType == "application/json"
      else { return }
      guard let data = data else { return print("no data") }
      
      guard
        let todo = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
        let todoID = todo["id"] as? Int,
        let todoTitle = todo["title"] as? String
      else { return print("could not get parsed data") }
      
      print("todoID: \(todoID)")
      print("todoTitle: \(todoTitle)")
    }
    task.resume()
    
  }
  
  
  @IBAction func requestPost(_ sender: Any) {
    print("\n---------- [ Post Method ] ----------\n")
    
    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos"
    guard let todosURL = URL(string: todoEndpoint) else { return }
    
    let newToDo: [String: Any] = ["title": "My ToDo", "userID": "20", "ab": ["df", "df"]]
    guard let jsonToDo = try? JSONSerialization.data(withJSONObject: newToDo) else { return }
    
    var urlRequest = URLRequest(url: todosURL)
    urlRequest.httpMethod = "POST"
    urlRequest.httpBody = jsonToDo
    
    let task = URLSession.shared.dataTask(with: urlRequest) {
      (data, response, error) in
      guard let data = data,
        let newItem = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
      print(newItem)
      if let id = newItem["id"] as? Int {
        print(id)
      }
    }
    task.resume()
    
  }
  
  @IBAction func requestDelete(_ sender: Any) {
    print("\n---------- [ Delete Method ] ----------\n")
    
    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos/1"
    
    let url = URL(string: todoEndpoint)!
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "DELETE"
    
    let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
      guard error == nil else { return print(error!.localizedDescription) }
      guard let data = data else { return print("no data") }
      print("DELETE")
      
      print((response as! HTTPURLResponse).statusCode)
      
      if let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
        print("data:", data) // 2 byte
        print("jsonObject:", jsonObject) // [:]
      }
    }
    task.resume()
    
  }
}

