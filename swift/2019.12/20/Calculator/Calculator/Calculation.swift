//
//  Calculation.swift
//  Calculator
//
//  Created by Soohan Lee on 2019/12/20.
//  Copyright © 2019 Soohan. All rights reserved.
//

import Foundation

final class Calculation {
    
    private var number: Double = 0.0
    
    func getNumber() -> Double { number }
    
    func initNumber() { number = 0 }
    
    func combineNumberWith(_ number: Double) {
        if self.number <= Double(Int(self.number)) {
            self.number = Double("\(Int(self.number))" + "\(Int(number))")!
        } else {
            self.number = Double("\(self.number)" + "\(Int(number))")!
        }
    }
    
    func plus(_ number: Double) { self.number += number }
    
    func minus(_ number: Double) { self.number -= number }
    
    func multiply(_ number: Double) { self.number *= number }
    
    func division(_ number: Double) { self.number /= number }
    
    func plusMinus() { number = -number }
    
    func percent() { number /= 100 }
    
}

enum Operator {
    case plus, minus, multiply, division, none
}
