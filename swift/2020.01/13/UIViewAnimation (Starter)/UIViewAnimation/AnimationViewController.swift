//
//  AnimationViewController.swift
//  UIViewAnimation
//
//  Created by giftbot on 2020. 1. 7..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class AnimationViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet private weak var userIdTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet private weak var countDownLabel: UILabel!
    
    var count = 4 {
        didSet { countDownLabel.text = "\(count)" }
    }
    
    // MARK: - View LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        userIdTextField.center.x = -containerView.frame.width
        passwordTextField.center.x = -containerView.frame.width
        loginButton.center.x = -containerView.frame.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let textFieldX = self.containerView.frame.midX - 10
        
        UIView.animate(withDuration: 0.6) {
            self.userIdTextField.center.x = textFieldX
        }
        
        UIView.animate(withDuration: 0.6, delay: 0.5, animations: {
            self.passwordTextField.center.x = textFieldX
        })
        
        UIView.animate(withDuration: 0.6, delay: 1, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: [.curveEaseInOut], animations: {
            self.loginButton.center.x = textFieldX
        }, completion: {
            print("isFinished:", $0)
        })
        
        addAnimateKeyframes()
    }
    
    // MARK: - Action Handler
    
    @IBOutlet private weak var testView: UIView!
    
    @IBAction private func didEndOnExit(_ sender: Any) {}
    
    @IBAction private func login(_ sender: Any) {
        view.endEditing(true)
        
        guard countDownLabel.isHidden else { return }
        
        loginButtonAnimation()
        
        countDown()
    }
    
    
    func addAnimateKeyframes() {
        let initialFrame = testView.frame
        UIView.animateKeyframes(
            withDuration: 4,
            delay: 0,
            animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                    self.testView.center.x += 50
                    self.testView.center.y -= 150
                }
                UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                    self.testView.center.x += 50
                    self.testView.center.y += 50
                }
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                    self.testView.center.x -= 100
                    self.testView.center.y -= 100
                }
                UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.5) {
                    self.testView.frame = initialFrame
                }
        })
    }
    
    func loginButtonAnimation() {
        activityIndicatorView.startAnimating()
        let centerOrigin = loginButton.center
        UIView.animateKeyframes(withDuration: 1.6, delay: 0, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                self.loginButton.center.x += 50
                self.loginButton.center.y += 20
            }
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.loginButton.transform = CGAffineTransform(rotationAngle: .pi / 4)
                self.loginButton.center.x += 150
                self.loginButton.center.y -= 70
                self.loginButton.alpha = 0
            }
            UIView.addKeyframe(withRelativeStartTime: 0.51, relativeDuration: 0.01) {
                self.loginButton.transform = .identity
                self.loginButton.center = CGPoint(
                    x: centerOrigin.x,
                    y: self.loginButton.superview!.frame.height + 120
                )
            }
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.loginButton.alpha = 1
                self.loginButton.center = centerOrigin
            }
        }) { _ in
//            self.activityIndicatorView.stopAnimating()
        }
    }
    
    func countDown() {
        countDownLabel.isHidden = false
        
        UIView.transition(
            with: countDownLabel,
            duration: 0.4,
            options: [.transitionCrossDissolve],
            animations: { self.count -= 1 }
        ) { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                guard self.count == 0 else { return self.countDown() }
                
                self.count = 4
                self.countDownLabel.isHidden = true
                self.activityIndicatorView.stopAnimating()
            }
        }
    }
}
