//
//  ServiceManager.swift
//  AlamofireExample
//
//  Created by Soohan Lee on 2020/02/21.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

import Alamofire

final class ServiceManager {
  static let shared = ServiceManager()
  
  private init() {
    reachability?.startListening { status in
      switch status {
      case .notReachable:               print("notReachable")
      case .reachable(.cellular):       print("cellular")
      case .reachable(.ethernetOrWiFi): print("ethernetOrWiFi")
      case .unknown:                    print("unknown")
      }
    }
  }
  
  private var reachability = NetworkReachabilityManager(host: "google.com")
  
  func requestUser(completionHandler: @escaping (Result<[User], Error>) -> Void) {
    AF.request("https://go.aws/2PcKamh")
      .validate()     // 200.999 statusCode
      .validate(contentType: ["application/json"])
      
      .responseDecodable { (response: DataResponse<[User], AFError>) in
        switch response.result {
        case .success(let users):
          completionHandler(.success(users))
        case .failure(let error):
          completionHandler(.failure(error))
        }
    }
//    .responseDecodable(
//      of: <#type#>.self,
//      queue: <#.main#> or <#.blobal#>,
//      decoder: <#T##DataDecoder#>) {
//
//    }
  }
  
  func requestImage(_ url: String, completionHandler: @escaping (Result<Data, Error>) -> Void) {
    AF.request(url)
    .validate()
      .responseData { (response) in
        switch response.result {
        case .success(let data):
          completionHandler(.success(data))
        case .failure(let error):
          completionHandler(.failure(error))
        }
    }
  }
}
