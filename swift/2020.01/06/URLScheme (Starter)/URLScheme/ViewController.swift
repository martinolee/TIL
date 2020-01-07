//
//  ViewController.swift
//  URLScheme
//
//  Created by giftbot on 2020. 1. 4..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func openSetting(_ sender: Any) {
        print("\n---------- [ openSettingApp ] ----------\n")
        
        guard let url = URL(string: UIApplication.openSettingsURLString),
            UIApplication.shared.canOpenURL(url)
            else { return }
        
        UIApplication.shared.open(url)
    }
    
    @IBAction private func openMail(_ sender: Any) {
        print("\n---------- [ openMail ] ----------\n")
        
        let scheme = "mailto:sjobs@apple.com?cc=foo@bar.com&subject=title&body=MyText&nbsp;A"
        
        guard let url = URL(string: scheme),
            UIApplication.shared.canOpenURL(url)
            else { return }
        
        UIApplication.shared.open(url)
    }
    
    @IBAction private func openMessage(_ sender: Any) {
        print("\n---------- [ openMessage ] ----------\n")
        
        let url = URL(string: "sms:010-1111-1111&body=Hello")!
        
        guard UIApplication.shared.canOpenURL(url) else { return }
        
        UIApplication.shared.open(url)
    }
    
    @IBAction private func openWebsite(_ sender: Any) {
        print("\n---------- [ openWebsite ] ----------\n")
        
        let url = URL(string: "https://google.com")!
        
        guard UIApplication.shared.canOpenURL(url) else { return }
        
        UIApplication.shared.open(url)
    }
    
    @IBAction private func openInstagram(_ sender: Any) {
        print("\n---------- [ openFacebook ] ----------\n")
        
        let url = URL(string: "instagram://user?username=soohan_lee")!
        
        guard UIApplication.shared.canOpenURL(url) else { return }
        
        UIApplication.shared.open(url)
    }
    
    @IBAction private func openMyApp(_ sender: Any) {
        print("\n---------- [ openMyApp ] ----------\n")
        
        /*
         myApp://host?name=steveJobs&age=50
         - scheme: myApp
         - host: host
         - query: name=abc&age=10
         */
        
        let url = URL(string: "myApp://host?name=steveJobs&age=50")!
        
        guard UIApplication.shared.canOpenURL(url) else { return }
        
        UIApplication.shared.open(url)
    }
}




