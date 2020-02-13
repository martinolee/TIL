//
//  ReferUserInfoViewController.swift
//  FirebaseExample
//
//  Created by Soohan Lee on 2020/02/12.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

import UIKit
import Firebase

class ReferUserInfoViewController: UIViewController {
  
  // MARK: - Properties
  
  @IBOutlet weak var nameTextField: UITextField!
  
  @IBOutlet weak var userIdLabel: UILabel!
  @IBOutlet weak var userBirthdayLabel: UILabel!
  @IBOutlet weak var userEmailLabel: UILabel!
  
  var ref: DatabaseReference!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  @IBAction func searchUser(_ sender: UIButton) {
    guard let name = nameTextField.text else { return }
    
  }
  
  @IBAction func deleteUser(_ sender: UIButton) {
    
  }
  
}
