//
//  ViewController.swift
//  DynamicAutoLayoutExample
//
//  Created by Soohan Lee on 2019/12/16.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myViewYConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
        UIView.animate(withDuration: 3) {
            self.myViewYConstraint.constant = 100
//            self.myViewYConstraint.priority = .defaultHigh
            self.loadViewIfNeeded()
        }
        
        
        
    }


}

