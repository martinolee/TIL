//
//  PopUpViewController.swift
//  AlertExample
//
//  Created by Soohan Lee on 2019/12/04.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
 
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.becomeFirstResponder() 
    }
    
    
    @IBAction func changeText(_ sender: Any) {
        let mainVC = presentingViewController as? MainViewController
        
        if let text = textField.text  { mainVC?.label.text = text }
    }
    
}
