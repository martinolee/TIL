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
            
            if switchButton.isOn { statementLabel.text = "On"  }
            else                 { statementLabel.text = "Off" }
            
        } else {
            
            let title = segment.titleForSegment(at: segment.selectedSegmentIndex)
            
            switch segment.selectedSegmentIndex {
            case 0: statementLabel.text = title
            case 1: statementLabel.text = title
            case 2: statementLabel.text = title
            case 3: statementLabel.text = title
            case 4: statementLabel.text = title
            default: break
            }
            
        }
        
    }
    
}
