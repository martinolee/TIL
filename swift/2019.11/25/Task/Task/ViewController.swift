//
//  ViewController.swift
//  Task
//
//  Created by Soohan Lee on 2019/11/25.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

var number = 0

class ViewController: UIViewController {
    
    let label = UILabel()
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .random()
        
        setupLabel()
        setupButton()
    }
    
    func setupLabel() {
        label.frame.size = CGSize(width: view.frame.width, height: 100)
        label.center = view.center
        label.text = "\(number)"
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: 90)
        view.addSubview(label)
    }
    
    func setupButton() {
        button.frame = CGRect(x: 0, y: view.bounds.height - 200, width: view.bounds.width, height: 100)
        button.setTitle("Go to Next View", for: .normal)
        button.setTitleColor(.random(), for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 20)
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        button.titleLabel?.textAlignment = NSTextAlignment.center
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc
    func didTapButton(_ sender: UIButton) {
        let nextVC = NextViewController()
        nextVC.modalPresentationStyle = .fullScreen
        
        number += 1
        present(nextVC, animated: true, completion: nil)
    }

}

