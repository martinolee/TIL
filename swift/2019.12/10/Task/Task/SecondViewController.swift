//
//  SecondViewController.swift
//  Task
//
//  Created by Soohan Lee on 2019/12/10.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate {
    func deliverText(_ text: String) -> String
}

class SecondViewController: UIViewController {
    
    var delegate: SecondViewControllerDelegate?
    
    var text = ""
    
    var isDelegateB = false
    
    @IBOutlet private weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isDelegateB {
            let firstVC = presentingViewController as! FirstViewController
            label.text = firstVC.deliverText(firstVC.textField.text ?? "")
        } else {
            label.text = text
        }
        
    }

}

extension SecondViewController: FirstViewControllerDelegate {
    func textField(_ text: String) {
        self.text = text
    }
}
