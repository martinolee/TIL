//
//  SignUpViewController.swift
//  LogInExample
//
//  Created by Soohan Lee on 2019/12/13.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var eMailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var reEnterPasswordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet var signUpButtonBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpButton.layer.cornerRadius = 6
        
        hideKeyboardWhenTappedAround()
        
        eMailTextField.delegate = self
        passwordTextField.delegate = self
        reEnterPasswordTextField.delegate = self
        
        whenKeyboardShowUpLogInField()
        whenKeyboardShowDownLogInField()
    }
    
    func whenKeyboardShowUpLogInField() {
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: OperationQueue.main
        ) { (noti) in
            if let frameValue = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardFrame = frameValue.cgRectValue
                
                self.signUpButtonBottomConstraint.constant = keyboardFrame.size.height + 20
                
                UIView.animate(withDuration: 0.3) { self.view.layoutIfNeeded() }
            }
        }
    }
    
    func whenKeyboardShowDownLogInField() {
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: OperationQueue.main
        ) { (noti) in
            self.signUpButtonBottomConstraint.constant = 20
            
            UIView.animate(withDuration: 0.3) { self.view.layoutIfNeeded() }
        }
    }
    
    private func isValid(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailPred.evaluate(with: email)
    }
    
    @IBAction func signUpButtonTouchUpInside(_ sender: Any) {
        signUp()
    }
    
    func signUp() {
        guard
            let email = eMailTextField.text,
            let password = passwordTextField.text,
            let reEnterPassword = reEnterPasswordTextField.text else { return }
        
        if !isValid(email: email) {
            UIView.animate(withDuration: 0.2) {
                self.eMailTextField.backgroundColor = UIColor(red: 255/255, green: 0, blue: 0, alpha: 1)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                UIView.animate(withDuration: 0.2) {
                    self.eMailTextField.backgroundColor = UIColor(red: 255/255, green: 0, blue: 0, alpha: 0)
                }
            }
        }
        
        if (password.count < 4 || password.count > 16) || !(password == reEnterPassword) {
            UIView.animate(withDuration: 0.2) {
                self.passwordTextField.backgroundColor = UIColor(red: 255/255, green: 0, blue: 0, alpha: 1)
                self.reEnterPasswordTextField.backgroundColor = UIColor(red: 255/255, green: 0, blue: 0, alpha: 1)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                UIView.animate(withDuration: 0.2) {
                    self.passwordTextField.backgroundColor = UIColor(red: 255/255, green: 0, blue: 0, alpha: 0)
                    self.reEnterPasswordTextField.backgroundColor = UIColor(red: 255/255, green: 0, blue: 0, alpha: 0)
                }
            }
        }
        
        if isValid(email: email) && (password.count >= 4 || password.count <= 16) && (password == reEnterPassword) {
            UserDefaults.standard.set(email, forKey: Key.eMail)
            UserDefaults.standard.set(password, forKey: Key.password)
            
            dismiss(animated: true)
        }
        
    }
    
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == eMailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            reEnterPasswordTextField.becomeFirstResponder()
        } else {
            view.endEditing(false)
            return true
        }
        
        return true
    }
}
