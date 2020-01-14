//
//  UrlWSViewController.swift
//  SlackNewWorkspaceUI
//
//  Created by giftbot on 2020/01/07.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class UrlWSViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var urlTextField: UITextField!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleLabelBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var urlLabelLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    var name = "" {
        didSet {
            finalUrl = name + ".slack.com"
        }
    }
    
    var finalUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urlTextField.delegate = self
        
        urlTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        urlTextField.text = name
        
        nextButton.addTarget(self, action: #selector(nextButtonDidTap(_:)), for: .touchUpInside)
        
        updateUrlLabelLocation()
        setStatusOfStatusLabel()
        
        urlTextField.becomeFirstResponder()
    }
    
    @objc
    private func textFieldDidChange(_ textField: UITextField) {
        updateName()
        updateUrlLabelLocation()
        setStatusOfStatusLabel()
        setStatusOfStatusLabel()
    }
    
    private func updateName() {
        name = urlTextField.text ?? ""
    }
    
    private func setStatusOfNextButton() {
        if name.count == 0 {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
    }
    
    @objc
    private func nextButtonDidTap(_ button: UIButton) {
        setStatusOfStatusLabel()
    }
    
    private func setStatusOfStatusLabel() {
        if name.count == 0 || name.lowercased() == "error" || name.lowercased() == "fail" {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
            
            statusLabel.isHidden = false
            urlTextField.shake()
            urlLabel.shake()
            nextButton.isEnabled = false
        } else {
            statusLabel.isHidden = true
            nextButton.isEnabled = true
        }
    }
    
    private func updateUrlLabelLocation() {
        let nsStr = NSString(string: name)
        
        let dict = [NSAttributedString.Key.font: urlTextField.font!]
        
        let width = nsStr.size(withAttributes: dict).width
        
        urlLabelLeadingConstraint.constant = width
    }
  
}

extension UrlWSViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if name.count == 0 {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
            
            return false
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

extension UITextField {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-10.0, 10.0, -10.0, 10.0, -5.0, 5.0, -2.5, 2.5, 0.0]
        layer.add(animation, forKey: "shake")
    }
}

extension UILabel {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-10.0, 10.0, -10.0, 10.0, -5.0, 5.0, -2.5, 2.5, 0.0]
        layer.add(animation, forKey: "shake")
    }
}
