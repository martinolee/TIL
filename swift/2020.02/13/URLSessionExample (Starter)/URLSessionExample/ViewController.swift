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
  }
  
  
  
  // MARK: - Session Configuration
  
  @IBAction private func sessionConfig(_ sender: Any) {
    print("\n---------- [ Session Configuration ] ----------\n")
    
  }
  

  // MARK: - Get, Post, Delete
  
  // https://jsonplaceholder.typicode.com/
  
  @IBAction func requestGet(_ sender: Any) {
    print("\n---------- [ Get Method ] ----------\n")
//    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos/1"
    
  }
  
  
  @IBAction func requestPost(_ sender: Any) {
    print("\n---------- [ Post Method ] ----------\n")
//    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos"
  }
  
  @IBAction func requestDelete(_ sender: Any) {
    print("\n---------- [ Delete Method ] ----------\n")
//    let todoEndpoint = "https://jsonplaceholder.typicode.com/todos/1"
  }
}

