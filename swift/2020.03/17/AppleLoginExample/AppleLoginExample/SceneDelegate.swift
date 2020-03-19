//
//  SceneDelegate.swift
//  AppleLoginExample
//
//  Created by Giftbot on 2020/03/17.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit
import AuthenticationServices

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let _ = (scene as? UIWindowScene) else { return }
    
    appleIDCredentialState()
  }
  
  func appleIDCredentialState() {
    guard
      let data = UserDefaults.standard.data(forKey: "AppleIDData"),
      let user = try? JSONDecoder().decode(User.self, from: data)
    else { return }
    
    print(user)
    
    let appleIDProvider = ASAuthorizationAppleIDProvider()
    appleIDProvider.getCredentialState(forUserID: user.id) { credentialState, error in
      switch credentialState {
      case .authorized:
        print("authorized")
      case .revoked:
        print("revoked")
      case .notFound:
        print("notFound")
      default: break
      }
    }
  }
}
