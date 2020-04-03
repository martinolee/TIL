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
  private lazy var tableView = UITableView().then {
    $0.dataSource = self
    $0.delegate = self
    
    $0.register(UserInfoTableViewCell.self, forCellReuseIdentifier: "Cell")
    
    $0.rowHeight = UITableView.automaticDimension
//    $0.estimatedRowHeight = 600
  }
  
  private let swiftImageView = UIImageView().then {
    $0.contentMode = .scaleAspectFit
    $0.backgroundColor = .cyan
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(tableView)
    tableView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
//    view.addSubview(swiftImageView)
//    setupSwiftImageViewAutoLayout()
    

//    swiftImageView.kf.setImage(with: image)
  }
  
  private func setupSwiftImageViewAutoLayout() {
    swiftImageView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide).inset(50)
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

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? UserInfoTableViewCell
      else { fatalError() }
    cell.delegate = self
    
    let imageURL = URL(string: "https://developer.apple.com/swift/images/swift-og.png")!
    let image = ImageResource(downloadURL: imageURL)
    
    cell.configure(userProfileImageResource: image, userName: "Steve Jobs", extraInfo: "5% 적립 + 최초 1회 무료배송")
    
    return cell
  }
}

extension ViewController: UserInfoTableViewCellDelgate {
  func whenLeftButtonDidTouchUpInside(_ button: UIButton) {
    print("whenLeftButtonDidTouchUpInside")
  }
  
  func whenRightButtonDidTouchUpInside(_ button: UIButton) {
    print("whenRightButtonDidTouchUpInside")
  }
}

extension ViewController: UITableViewDelegate {
}
