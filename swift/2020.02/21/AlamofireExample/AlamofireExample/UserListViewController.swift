//
//  FriendListViewController.swift
//  AlamofireExample
//
//  Created by Soohan Lee on 2020/02/21.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

import UIKit
import Alamofire

class UserListViewController: UIViewController {
  
  // MARK: - Properties
  
  private let serviceManager = ServiceManager.shared
  
  private var userData: [User] = [] {
    didSet { userTableView.reloadData() }
  }
  
  @IBOutlet weak var userTableView: UITableView!
  
  // MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    userTableView.rowHeight = 60
    
    ServiceManager.shared.requestUser {
      do {
        self.userData = try $0.get()
      } catch {
        print(error.localizedDescription)
      }
    }
  }
  
  func requestCellData(_ cell: UITableViewCell, for indexPath: IndexPath) {
    let user = userData[indexPath.row]
    serviceManager.requestImage(user.photo) { [weak self] response in
      guard let data = try? response.get() else { return }
      
      if let cell = self?.userTableView.cellForRow(at: indexPath) {
        cell.textLabel?.text = user.fullName
        cell.detailTextLabel?.text = user.email
        cell.imageView?.image = UIImage(data: data)
      }
    }
  }
  
}

extension UserListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    userData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
    
    requestCellData(cell, for: indexPath)
    
    return cell
  }
  
}
