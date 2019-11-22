//
//  ViewController.swift
//  SwitchOnAndOff
//
//  Created by Soohan Lee on 2019/11/22.
//  Copyright © 2019 Soohan. All rights reserved.


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var statementLabel: UILabel!
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var segment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeLabel(_ sender: Any) {
        if sender as? UISwitch == switchButton {
            if switchButton.isOn { statementLabel.text = "On" }
            else { statementLabel.text = "Off" }
        } else {
            switch segment.selectedSegmentIndex {
            case 0: statementLabel.text = "Pizza"
            case 1: statementLabel.text = "Pasta"
            case 2: statementLabel.text = "Ramen"
            case 3: statementLabel.text = "iPhone"
            case 4: statementLabel.text = "iMac"
            default: statementLabel.text = "Error"
            }
        }
    }
    
    
    
}

