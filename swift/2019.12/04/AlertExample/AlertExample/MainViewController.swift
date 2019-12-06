//
//  MainViewController.swift
//  AlertExample
//
//  Created by Soohan Lee on 2019/12/04.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func unwindToMainVC(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
        
    }
    @IBAction func showPopUp(_ sender: Any) {
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let popUpView = storyboard.instantiateViewController(withIdentifier: "PopUp") as! PopUpViewController
        
        present(popUpView, animated: true, completion: nil)
    }
    
}
