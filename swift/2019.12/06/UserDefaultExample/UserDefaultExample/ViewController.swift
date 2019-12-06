//
//  ViewController.swift
//  UserDefaultExample
//
//  Created by Soohan Lee on 2019/12/06.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var onOffSwitch: UISwitch!
    
    struct key {
        static let animal = "animal"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        guard let animal = UserDefaults.standard.value(forKey: key.animal) as? String else {
            UserDefaults.standard.set("dog", forKey: key.animal)
            return
        }
        
        animal == "cat" ? (onOffSwitch.setOn(true, animated: true)) : (onOffSwitch.setOn(false, animated: true))
        imageView.image = UIImage(named: animal)
        label.text = animal
    }

    @IBAction func switchValueChanged(_ sender: Any) {
        if UserDefaults.standard.value(forKey: key.animal) as! String != "cat" {
            UserDefaults.standard.set("cat", forKey: key.animal)
        } else {
            UserDefaults.standard.set("dog", forKey: key.animal)
        }
        
        imageView.image = UIImage(named: UserDefaults.standard.value(forKey: key.animal) as! String)
        label.text = UserDefaults.standard.value(forKey: key.animal) as? String
    }
    
}

