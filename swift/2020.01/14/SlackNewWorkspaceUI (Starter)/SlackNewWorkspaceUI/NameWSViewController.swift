//
//  NameWSViewController.swift
//  SlackNewWorkspaceUI
//
//  Created by giftbot on 2020/01/07.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit
import AudioToolbox

final class NameWSViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var PlacehoderLabelCenterYConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleLabelBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var placeholderLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var activityIndicatorLeadingConstraint: NSLayoutConstraint!
    
    private var isCheckingName = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        nextButton.addTarget(self, action: #selector(nextButtonDidTap(_:)), for: .touchUpInside)
        
        nameTextField.delegate = self
        
        titleLabelBottomConstraint.constant = -20
        titleLabel.alpha = 0.0
        
        nextButton.isEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        nameTextField.becomeFirstResponder()
    }
    
    @IBAction func unwindToNameVC(_ unwindSegue: UIStoryboardSegue) {
//        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }
    
    @objc
    private func nextButtonDidTap(_ sender: UIButton) {
        rotatingActivityIndicator()
        
        pushUrlVC()
    }
    
    private func rotatingActivityIndicator() {
        activityIndicator.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.activityIndicator.stopAnimating()
        }
    }
    
    @objc
    private func textFieldDidChange(_ textField: UITextField) {
        let finalText = textField.text ?? ""
        
        UIView.animate(withDuration: 0.3) {
            if finalText.count == 0 {
                self.placeholderLabel.alpha = 1.0
                
                self.titleLabelBottomConstraint.constant = -20
                self.titleLabel.alpha = 0.0
                
                self.nextButton.isEnabled = false
            } else {
                self.placeholderLabel.alpha = 0.0
                
                self.titleLabelBottomConstraint.constant = 10
                self.titleLabel.alpha = 1.0
                
                self.nextButton.isEnabled = true
            }
            
            self.view.layoutIfNeeded()
        }
        
        let nsStr = NSString(string: finalText)
        
        let dict = [NSAttributedString.Key.font: textField.font!]
        
        let width = nsStr.size(withAttributes: dict).width
        
        let spacing: CGFloat = 10
        
        activityIndicatorLeadingConstraint.constant = width + spacing
    }
    
    private func pushUrlVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let urlVC = storyboard.instantiateViewController(withIdentifier: "UrlVC") as! UrlWSViewController
        urlVC.name = nameTextField.text ?? ""
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.navigationController?.pushViewController(urlVC, animated: true)
        }
    }
}

extension NameWSViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let text = textField.text ?? ""
        
        if text.count == 0 {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
            
            return false
        } else {
            rotatingActivityIndicator()
            
            pushUrlVC()
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentCharacterCount = textField.text?.count ?? 0
        if range.length + range.location > currentCharacterCount {
            return false
        }
        
        let newLength = currentCharacterCount + string.count - range.length
        return newLength <= 20
    }
}
