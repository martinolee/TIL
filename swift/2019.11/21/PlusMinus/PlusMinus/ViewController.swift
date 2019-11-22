//
//  ViewController.swift
//  PlusMinus
//
//  Created by Soohan Lee on 2019/11/21.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    var number = 0
    
    var plusTimer: Timer?
    var minusTimer: Timer?
    
    var repeatingTime = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plusButton.addTarget(self, action: #selector(plusButtonDown), for: .touchDown)
        plusButton.addTarget(self, action: #selector(buttonUp), for: [.touchUpInside, .touchUpOutside])
        
        minusButton.addTarget(self, action: #selector(minusButtonDown), for: .touchDown)
        minusButton.addTarget(self, action: #selector(buttonUp), for: [.touchUpInside, .touchUpOutside])
    }
    
    @objc
    func plusButtonDown(_ sender: UIButton) {
        plus()
        
        plusTimer = Timer.scheduledTimer(timeInterval: repeatingTime, target: self, selector: #selector(plus), userInfo: nil, repeats: true)
    }
    
    @objc
    func plus() {
        number += 1
        
        numberLabel.text = "\(number)"
        numberLabel.textColor = .systemBlue
        repeatingTime -= 0.1
        
        plusTimer = Timer.scheduledTimer(timeInterval: repeatingTime, target: self, selector: #selector(plus), userInfo: nil, repeats: true)
    }
    
    @objc
    func minusButtonDown(_ sender: UIButton) {
        minus()
        
        minusTimer = Timer.scheduledTimer(timeInterval: repeatingTime, target: self, selector: #selector(minus), userInfo: nil, repeats: true)
    }
    
    @objc
    func minus() {
        number -= 1
        
        numberLabel.text = "\(number)"
        numberLabel.textColor = .systemRed
    }
    
    @objc
    func buttonUp(_ sender: UIButton) {
        plusTimer?.invalidate()
        minusTimer?.invalidate()
    }
    
}
