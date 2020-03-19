//
//  LoginViewController.swift
//  AppleLoginExample
//
//  Created by Giftbot on 2020/03/17.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit
import AuthenticationServices

class LoginViewController: UIViewController {
  
  @IBOutlet private weak var stackView: UIStackView!
  private var appleIDButton = ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .white)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupAppleIDButton()
    setAppleIDAppearance()
  }
  
  private func setupAppleIDButton() {
    appleIDButton.cornerRadius = 6.0
    appleIDButton.addTarget(self, action: #selector(didTapAppleIDButton(_:)), for: .touchUpInside)
    
    stackView.subviews.first?.isHidden = true
    stackView.addArrangedSubview(appleIDButton)
  }
  
  
  // MARK: Action
  
  @objc private func didTapAppleIDButton(_ sender: Any) {
    let idRequest = ASAuthorizationAppleIDProvider().createRequest()
    idRequest.requestedScopes = [.email, .fullName]
    
    let authorizationController = ASAuthorizationController(authorizationRequests: [idRequest])
    authorizationController.delegate = self
    
    authorizationController.presentationContextProvider = self
    authorizationController.performRequests()
  }
  
  private func setAppleIDAppearance() {
    
  }
  
  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
  }
}

extension LoginViewController: ASAuthorizationControllerDelegate {
  func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    guard let error = error as? ASAuthorizationError else { return }
    
    switch error.code {
    case .unknown:
      print("Unknown")
    case .canceled:
      print("Canceled")
    case .invalidResponse:
      print("Invalid Response")
    case .notHandled:
      print("Not Handled")
    case .failed:
      print("Failed")
    @unknown default:
      print("default")
    }
  }
  
  func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
    guard
      let idCredential = authorization.credential as? ASAuthorizationAppleIDCredential,
      let idToken = idCredential.identityToken,
      let tokenString = String(data: idToken, encoding: .utf8)
    else { return }
    
    print(tokenString)
    let userID = idCredential.user
    let familyName = idCredential.fullName?.familyName ?? ""
    let givenName = idCredential.fullName?.givenName ?? ""
    let email = idCredential.email ?? ""
    
    let user = User(id: userID, familyName: familyName, givenName: givenName, email: email)
    print(user)
    
    let vc = presentingViewController as! ViewController
    vc.user = user
    
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(user) {
        let defaults = UserDefaults.standard
        defaults.set(encoded, forKey: "AppleIDData")
    }
    
    switch idCredential.realUserStatus {
    case .likelyReal:
      print("likely real user")
    case .unknown:
      print("not sure real user or might be bot")
    case .unsupported:
      print("not iOS")
    @unknown default:
      print("default")
    }
    
    dismiss(animated: true)
  }
}

extension LoginViewController: ASAuthorizationControllerPresentationContextProviding {
  func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
    self.view.window!
  }
}
