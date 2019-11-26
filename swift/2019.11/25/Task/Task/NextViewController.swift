//
//  NextViewController.swift
//  Task
//
//  Created by Soohan Lee on 2019/11/25.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .random()
        
        setupButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupLabel()
    }
    
    func setupLabel() {
        let label = UILabel()
        guard let vc = presentingViewController as? ViewController else { return }
        
        label.frame.size = CGSize(width: view.frame.width, height: 100)
        label.center = view.center
        label.text = "\(vc.number)"
        label.textAlignment = .center
        label.font = UIFont(name: "Arial", size: 90)
        
        label.textColor = .random()
        view.addSubview(label)
    }
    
    func setupButton() {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: view.bounds.height - 200, width: view.bounds.width, height: 100)
        button.setTitle("Back to Pervious View", for: .normal)
        button.setTitleColor(.random(), for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 20)
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        button.titleLabel?.textAlignment = NSTextAlignment.center
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc
    func didTapButton(_ sender: UIButton) {
        guard let vc = presentingViewController as? ViewController else { return }
        vc.number += 1
        vc.label.text = "\(vc.number)"
        vc.label.textColor = .random()
        vc.button.setTitleColor(.random(), for: .normal)
        vc.view.backgroundColor = .random()
        dismiss(animated: true, completion: nil)
    }

}
