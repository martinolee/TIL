//
//  ViewController.swift
//  Task26
//
//  Created by Soohan Lee on 2019/11/26.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func textFieldEditingDidBegin(_ sender: Any) {
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 40)
    }
    
    @IBAction func textFieldEditingChanged(_ sender: Any) {
        
        guard let text = textField.text else { return }
        
        label.text = text
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 40)
    }
    @IBAction func textFieldPrimaryActionTriggered(_ sender: Any) {
        label.textColor = .systemRed
        label.font = UIFont.systemFont(ofSize: 20)
        view.endEditing(true)
    }
}

