//
//  ViewController.swift
//  UserDefaults
//
//  Created by giftbot on 2019. 11. 20..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var alertSwitch: UISwitch!
    
    struct Key {
        static let date = "date"
        static let isOn = "isOn"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: Action Handler
    
    @IBAction func saveData(_ button: UIButton) {
        UserDefaults.standard.set(datePicker.date, forKey: Key.date)
        UserDefaults.standard.set(alertSwitch.isOn, forKey: Key.isOn)
    }
    
    @IBAction func loadData(_ button: UIButton) {
        guard let savedDate = UserDefaults.standard.value(forKey: Key.date) as? Date, let savedStatus = UserDefaults.standard.value(forKey: Key.isOn) as? Bool else { return }
        
        datePicker.setDate(savedDate, animated: true)
        alertSwitch.setOn(savedStatus, animated: true)
    }
}

