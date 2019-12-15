//
//  MainViewController.swift
//  LogInExample
//
//  Created by Soohan Lee on 2019/12/13.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var signOutButton: UIButton!
    @IBOutlet weak var eMailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signOutButton.layer.cornerRadius = 6
        eMailLabel.text = UserDefaults.standard.string(forKey: Key.eMail)
    }
    
    @IBAction func signOut(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: Key.isLoggedIn)
    }
}

