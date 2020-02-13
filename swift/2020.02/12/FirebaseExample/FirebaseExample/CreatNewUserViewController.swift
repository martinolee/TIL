//
//  ViewController.swift
//  FirebaseExample
//
//  Created by Soohan Lee on 2020/02/12.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

import UIKit
import Firebase

class CreatNewUserViewController: UIViewController {
  
  // MARK: - Properties
  
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var birthDayTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  
  @IBOutlet weak var successOrFailureLabel: UILabel!
  
  @IBOutlet weak var creatButton: UIButton!
  @IBOutlet weak var referButton: UIButton!
  
  var ref: DatabaseReference!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  @IBAction func creatNewUser(_ sender: UIButton) {
    guard
      let name = nameTextField.text,
      let email = emailTextField.text
      else { return }
    let birthday = birthDayTextField.text ?? ""
    
    let userInfo = [
      Key.name: name,
      Key.birthday: birthday,
      Key.email: email,
    ]
    
    ref = Database.database().reference()
    
    ref
      .child(Key.user)
      .childByAutoId()
      .setValue(userInfo) { (error:Error?, ref:DatabaseReference) in
        if let error = error {
          self.successOrFailureLabel.text = "Fail"
        } else {
          self.successOrFailureLabel.text = "Success"
        }
    }
    
  }
  
}

