//
//  LogInViewController.swift
//  LogInExample
//
//  Created by Soohan Lee on 2019/12/13.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var eMailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var passwordImageView: UIImageView!
    
    @IBOutlet weak var logInContainerView: UIView!
    @IBOutlet weak var logInContainerViewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        
        eMailTextField.delegate = self
        passwordTextField.delegate = self
        
        signInButton.layer.cornerRadius = 6
        
        whenKeyboardShowUpLogInField()
        whenKeyboardShowDownLogInField()
    }
    
    @IBAction func unwindToLogInVC(_ unwindSegue: UIStoryboardSegue) {
        let _ = unwindSegue.source // sourceViewController
        // Use data from the view controller which initiated the unwind segue
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "SignIn" {
            guard
                let inputEMail = eMailTextField.text,
                let inputPassword = passwordTextField.text,
                let userEMail = UserDefaults.standard.value(forKey: Key.eMail) as? String,
                let userPassword = UserDefaults.standard.value(forKey: Key.password) as? String
                else { return false }
            
            if (inputEMail == userEMail) && (inputPassword == userPassword) {
                UserDefaults.standard.set(true, forKey: Key.isLoggedIn)
                return true
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.eMailTextField.backgroundColor = UIColor(red: 255/255, green: 0, blue: 0, alpha: 1)
                    self.passwordTextField.backgroundColor = UIColor(red: 255/255, green: 0, blue: 0, alpha: 1)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    UIView.animate(withDuration: 0.2) {
                    self.eMailTextField.backgroundColor = UIColor(red: 255/255, green: 0, blue: 0, alpha: 0)
                    self.passwordTextField.backgroundColor = UIColor(red: 255/255, green: 0, blue: 0, alpha: 0)
                    }
                }
            }
            
            return false
        }
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SignIn" {
            UserDefaults.standard.set(true, forKey: Key.isLoggedIn)
        } else {
            
        }
        
    }
    
    func whenKeyboardShowUpLogInField() {
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: OperationQueue.main
        ) { (noti) in
            if let frameValue = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardFrame = frameValue.cgRectValue
                
                self.logInContainerViewBottomConstraint.constant = keyboardFrame.size.height + 20
                
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
            self.logInContainerViewBottomConstraint.constant = 100
            
            UIView.animate(withDuration: 0.3) { self.view.layoutIfNeeded() }
        }
    }
    
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == eMailTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            view.endEditing(false)
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        let maximumLength = 16
        
        return count <= maximumLength
    }
}
