//
//  SecondViewController.swift
//  Task
//
//  Created by Soohan Lee on 2019/12/06.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var secondVCLabel: UILabel!
    
    var isSingleton: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        if isSingleton {
            secondVCLabel.text = Data.shared.text
            print("Singleton")
        } else {
            secondVCLabel.text = UserDefaults.standard.value(forKey: Key.text) as? String
            print("UserDefaults")
        }
    }
}
