//
//  ViewController.swift
//  UIViewAnimationTask
//
//  Created by Soohan Lee on 2020/01/13.
//  Copyright © 2020 Soohan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var leftButton0 = UIButton()
    private lazy var leftButton1 = UIButton()
    private lazy var leftButton2 = UIButton()
    private lazy var leftButton3 = UIButton()
    private lazy var leftButton4 = UIButton()
    
    private lazy var rightButton0 = UIButton()
    private lazy var rightButton1 = UIButton()
    private lazy var rightButton2 = UIButton()
    private lazy var rightButton3 = UIButton()
    private lazy var rightButton4 = UIButton()
    
    private var leftButtons = [UIButton]()
    private var rightButtons = [UIButton]()
    
    private var areLeftButtonsOpened = false
    private var areRightButtonsOpened = false
    
    // MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeButtonList()
        configurationButtons()
    }
    
    private func makeButtonList() {
        leftButtons.append(leftButton0)
        leftButtons.append(leftButton1)
        leftButtons.append(leftButton2)
        leftButtons.append(leftButton3)
        leftButtons.append(leftButton4)
        
        rightButtons.append(rightButton0)
        rightButtons.append(rightButton1)
        rightButtons.append(rightButton2)
        rightButtons.append(rightButton3)
        rightButtons.append(rightButton4)
    }
    
    private func configurationButtons() {
        for i in 0 ..< leftButtons.count {
            leftButtons[i].frame = CGRect(x: 16, y: 689, width: 80, height: 80)
            leftButtons[i].setTitle("Button \(i)", for: .normal)
            leftButtons[i].titleLabel?.font = .systemFont(ofSize: 18)
            leftButtons[i].backgroundColor = .random()
            
            leftButtons[i].layer.masksToBounds = true
            leftButtons[i].layer.cornerRadius = leftButtons[i].bounds.width / 2
            
            rightButtons[i].frame = CGRect(x: 279, y: 689, width: 80, height: 80)
            rightButtons[i].setTitle("Button \(i)", for: .normal)
            rightButtons[i].titleLabel?.font = .systemFont(ofSize: 18)
            rightButtons[i].backgroundColor = .random()
            
            rightButtons[i].layer.masksToBounds = true
            rightButtons[i].layer.cornerRadius = rightButtons[i].bounds.width / 2
        }
        
        for i in (0 ..< leftButtons.count).reversed() {
            view.addSubview(leftButtons[i])
            view.addSubview(rightButtons[i])
        }
        
        setupOpenButton()
    }
    
    private func setupOpenButton() {
        leftButtons[0].addTarget(self, action: #selector(leftButtonAnimate), for: .touchUpInside)
        rightButtons[0].addTarget(self, action: #selector(rightButtonAnimate), for: .touchUpInside)
    }
    
    @objc
    private func leftButtonAnimate() {
        if areLeftButtonsOpened {
            closeLeftButtons()
        } else {
            openLeftButtons()
        }
    }
    
    @objc
    private func rightButtonAnimate() {
        if areRightButtonsOpened {
            closeRightButtons()
        } else {
            openRightButtons()
        }
    }
    
    private func openLeftButtons() {
        self.areLeftButtonsOpened = true
        UIView.animateKeyframes(
            withDuration: 0.5,
            delay: 0,
            options: [],
            animations: {
                let spacing: CGFloat = 30
                let buttonCount = self.leftButtons.count
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/4) {
                    for i in 1 ..< buttonCount {
                        self.leftButtons[i].center.y -= self.leftButtons[i].bounds.height + spacing
                    }
                }
                
                UIView.addKeyframe(withRelativeStartTime: 1/4, relativeDuration: 1/4) {
                    for i in 2 ..< buttonCount {
                        self.leftButtons[i].center.y -= self.leftButtons[i].bounds.height + spacing
                    }
                }
                
                UIView.addKeyframe(withRelativeStartTime: 2/4, relativeDuration: 1/4) {
                    for i in 3 ..< buttonCount {
                        self.leftButtons[i].center.y -= self.leftButtons[i].bounds.height + spacing
                    }
                }
                
                UIView.addKeyframe(withRelativeStartTime: 3/4, relativeDuration: 1/4) {
                    for i in 4 ..< buttonCount {
                        self.leftButtons[i].center.y -= self.leftButtons[i].bounds.height + spacing
                    }
                }
        }) { _ in
            self.areLeftButtonsOpened = true
        }
    }
    
    private func closeLeftButtons() {
        self.areLeftButtonsOpened = false
        
        UIView.animateKeyframes(
            withDuration: 0.5,
            delay: 0,
            options: [],
            animations: {
                let buttonCount = self.leftButtons.count
                
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/4) {
                    for i in 4 ..< buttonCount {
                        self.leftButtons[i].center = self.leftButtons[i - 1].center
                    }
                }
                
                UIView.addKeyframe(withRelativeStartTime: 1/4, relativeDuration: 1/4) {
                    for i in 3 ..< buttonCount {
                        self.leftButtons[i].center = self.leftButtons[i - 1].center
                    }
                }
                
                UIView.addKeyframe(withRelativeStartTime: 2/4, relativeDuration: 1/4) {
                    for i in 2 ..< buttonCount {
                        self.leftButtons[i].center = self.leftButtons[i - 1].center
                    }
                }
                
                UIView.addKeyframe(withRelativeStartTime: 3/4, relativeDuration: 1/4) {
                    for i in 1 ..< buttonCount {
                        self.leftButtons[i].center = self.leftButtons[i - 1].center
                    }
                }
        }) { _ in
            self.areLeftButtonsOpened = false
        }
    }
    
    private func openRightButtons() {
        self.areRightButtonsOpened = true
        
        let spacing: CGFloat = 30
        let buttonCount = self.leftButtons.count
        
        UIView.animateKeyframes(
            withDuration: 0.5,
            delay: 0,
            options: [],
            animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    for i in 1 ..< buttonCount {
                        self.rightButtons[i].center.y -= (self.rightButtons[i].bounds.height + spacing) * CGFloat(i)
                    }
                }
        }) { _ in
            
        }
    }
    
    private func closeRightButtons() {
        self.areRightButtonsOpened = false
        
        let buttonCount = self.leftButtons.count
        
        UIView.animateKeyframes(
            withDuration: 0.5,
            delay: 0,
            options: [],
            animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) {
                    for i in 1 ..< buttonCount {
                        self.rightButtons[i].center.y = self.rightButtons[0].center.y
                    }
                }
        }) { _ in
            
        }
    }
    
    // MARK: - Action Handler
    
    
}

