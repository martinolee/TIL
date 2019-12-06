//
//  FirstViewController.swift
//  Task
//
//  Created by Soohan Lee on 2019/12/06.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        textField.becomeFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let text = textField.text else { return }
        let secondVC = segue.destination as! SecondViewController
        
        if segue.identifier == "UserDefaults" {
            secondVC.isSingleton = false
            UserDefaults.standard.set(text, forKey: Key.text)
        } else {
            secondVC.isSingleton = true
            
            Data.shared.text = text
        }
    }
}
