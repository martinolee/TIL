//
//  ViewController.swift
//  LibrariesPractice
//
//  Created by Soohan Lee on 2020/03/19.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
import SnapKit
import Then

class ViewController: UIViewController {
  private let swiftImageView = UIImageView().then {
    $0.contentMode = .scaleAspectFit
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(swiftImageView)
    setupSwiftImageViewAutoLayout()
    
    let imageURL = URL(string: "https://developer.apple.com/swift/images/swift-og.png")!
    let image = ImageResource(downloadURL: imageURL)
    swiftImageView.kf.setImage(with: image)
    
    requestData("https://developer.apple.com/swift/images/swift-og.png") { result in
      switch result {
      case .success(let data):
        print(data)
      case .failure(let error):
        print(error)
      }
    }
  }
  
  private func setupSwiftImageViewAutoLayout() {
    swiftImageView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  private func requestData(_ url: String, completionHandler: @escaping (Result<Data, Error>) -> Void) {
    AF.request(url)
      .validate()
      .responseData { response in
        switch response.result {
        case .success(let data):
          completionHandler(.success(data))
        case .failure(let error):
          completionHandler(.failure(error))
        }
    }
  }
}
