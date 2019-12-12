//
//  FirstViewController.swift
//  Task
//
//  Created by Soohan Lee on 2019/12/10.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

protocol FirstViewControllerDelegate {
//    func deliverText(_ text: String) -> String
    func textField(_ text: String)
}

class FirstViewController: UIViewController {
    
    var delegate: FirstViewControllerDelegate?
    
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func unwindToFirstVC(_ unwindSegue: UIStoryboardSegue) {
        let _ = unwindSegue.source // sourceViewController
        // Use data from the view controller which initiated the unwind segue
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! SecondViewController
        guard let text = textField.text else { return }
        if segue.identifier == "A" {
            self.delegate = secondVC
            delegate?.textField(text)
            
            secondVC.text = deliverText(text)
        } else {
            secondVC.delegate = self
            
            secondVC.isDelegateB = true
        }
    }

}

extension FirstViewController: SecondViewControllerDelegate {
    func deliverText(_ text: String) -> String { text }
}


