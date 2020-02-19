//
//  ViewController.swift
//  FirebaseExample
//
//  Created by Soohan Lee on 2020/02/12.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAnalytics
import FirebaseRemoteConfig
import FirebaseUI

class CreatNewUserViewController: UIViewController {
  
  // MARK: - Properties
  
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var birthDayTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var helloLabel: UILabel!
  
  @IBOutlet weak var successOrFailureLabel: UILabel!
  
  @IBOutlet weak var creatButton: UIButton!
  @IBOutlet weak var referButton: UIButton!
  
  var ref: DatabaseReference!
  
  var remoteConfig: RemoteConfig!
  
  weak var authUI: FUIAuth!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fetchConfig()
    emailSignInCheck()
    googleSignInCheck()
  }
  
//  private func remoteConfigSetting() {
//    self.remoteConfig = RemoteConfig.remoteConfig()
//    let settings = remoteConfigSetting()
//    settings.minimumFetchInterval = 0
//    remoteConfig.configSettings = settings
//    fetchConfig()
//  }
  
  private func fetchConfig() {
//    self.helloLabel.isHidden = remoteConfig.configValue(forKey: "hello_text_hidden").boolValue
//    print(remoteConfig.configValue(forKey: "hello_text_hidden").boolValue)
  }
  
  @IBAction func creatNewUser(_ sender: UIButton) {
    creatUser()
    Analytics.logEvent("Button", parameters: nil)
    Analytics.logEvent(
      "Creat_button_Did_Touch_Up_Inside",
      parameters: ["Device": UIDevice.current.name]
    )
  }
  
  private func creatUser() {
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
          print(error.localizedDescription)
        } else {
          self.successOrFailureLabel.text = "Success"
        }
    }
  }
  
  private func emailSignInCheck() {
//    authUI = FUIAuth.defaultAuthUI()
//    authUI.delegate = self
//    authUI.providers = [FUIEmailAuth()]
//    authUI.shouldHideCancelButton = true
//
//    let authViewController = authUI.authViewController()
//    authViewController.modalPresentationStyle = .fullScreen
//    present(authViewController, animated: true)
  }
  
  private func googleSignInCheck() {
    authUI = FUIAuth.defaultAuthUI()
    authUI.delegate = self
    authUI.providers = [FUIEmailAuth(), FUIGoogleAuth(),]
    authUI.shouldHideCancelButton = true
    
    let authViewController = authUI.authViewController()
    authViewController.modalPresentationStyle = .fullScreen
    present(authViewController, animated: true)
  }
  
}

extension CreatNewUserViewController: FUIAuthDelegate {
  
}
