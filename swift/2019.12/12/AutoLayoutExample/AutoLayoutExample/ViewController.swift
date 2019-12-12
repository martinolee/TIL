//
//  ViewController.swift
//  AutoLayoutExample
//
//  Created by Soohan Lee on 2019/12/12.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let leftView = UIView()
    private let rightView = UIView()
    
    private let autoLayoutLeftView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .brown
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let autoLayoutRightView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setupLeftView()
//        view.addSubview(leftView)
        
//        setupRightView()
//        view.addSubview(rightView)
        
        view.addSubview(autoLayoutLeftView)
        view.addSubview(autoLayoutRightView)
        
        setupAutoLayoutLeftView()
        setupAutoLayoutRightView()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        setupLeftView()
        setupRightView()
        
        setupAutoLayoutLeftView()
        setupAutoLayoutRightView()
    }
    
    // MARK: Auto Layout with Code.
    
    func setupAutoLayoutLeftView() {
        let margin: CGFloat = 20
        let safeArea = self.view.safeAreaLayoutGuide
        
        let constraints = [
            autoLayoutLeftView.widthAnchor.constraint(equalTo: autoLayoutRightView.widthAnchor, multiplier: 1.0),
            autoLayoutLeftView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: margin),
            autoLayoutLeftView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: margin),
            autoLayoutLeftView.trailingAnchor.constraint(equalTo: autoLayoutRightView.leadingAnchor, constant: -10),
            autoLayoutLeftView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -margin),
            
        ]
        
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupAutoLayoutRightView() {
        let margin: CGFloat = 20
        let safeArea = self.view.safeAreaLayoutGuide
        
        let constraints = [
            autoLayoutRightView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: margin),
            autoLayoutRightView.leadingAnchor.constraint(equalTo: autoLayoutLeftView.trailingAnchor, constant: -10),
            autoLayoutRightView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -margin),
            autoLayoutRightView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -margin),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: Frame.
    
    func setupLeftView() {
        let safeAreaTop    = view.safeAreaInsets.top
        let safeAreaLeft   = view.safeAreaInsets.left
        let safeAreaBottom = view.safeAreaInsets.bottom
        
        let leftMargin: CGFloat = 20
        let topMargin: CGFloat = 20
        
        leftView.frame = CGRect(
            x: safeAreaLeft + leftMargin,
            y: safeAreaTop + topMargin,
            width: view.frame.width / 2 - (safeAreaLeft + leftMargin + 5),
            height: view.frame.height - (safeAreaBottom + safeAreaTop + 40)
        )
        
        leftView.backgroundColor = .brown
    }
    
    func setupRightView() {
        let leftMargin: CGFloat = 10

        rightView.frame = CGRect(
            x: leftView.frame.maxX + leftMargin,
            y: leftView.frame.minY,
            width: leftView.bounds.maxX,
            height: leftView.bounds.maxY
        )
        
        rightView.backgroundColor = .gray
    }
    
}

