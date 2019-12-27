//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Soohan Lee on 2019/12/20.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var plusMinusButton: UIButton!
    @IBOutlet weak var percentageButton: UIButton!
    
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
    @IBOutlet weak var decimalSeparatorButton: UIButton!
    
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    
    private var numberButtonArray = [UIButton]()
    private var operatorButtonArray = [UIButton]()
    private var etcButtonArray = [UIButton]()
    
    private let calculation = Calculation()
    
    private var currentOperator = Operator.none
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        etcButtonArray.append(clearButton)
        etcButtonArray.append(plusMinusButton)
        etcButtonArray.append(percentageButton)
        
        operatorButtonArray.append(divisionButton)
        operatorButtonArray.append(multiplyButton)
        operatorButtonArray.append(minusButton)
        operatorButtonArray.append(plusButton)
        operatorButtonArray.append(equalButton)
        
        etcButtonArray.append(decimalSeparatorButton)
        
        numberButtonArray.append(zeroButton)
        numberButtonArray.append(oneButton)
        numberButtonArray.append(twoButton)
        numberButtonArray.append(threeButton)
        numberButtonArray.append(fourButton)
        numberButtonArray.append(fiveButton)
        numberButtonArray.append(sixButton)
        numberButtonArray.append(sevenButton)
        numberButtonArray.append(eightButton)
        numberButtonArray.append(nineButton)
        
        for button in etcButtonArray {
            button.layer.masksToBounds = true
            button.layer.cornerRadius = button.layer.bounds.height / 2
            button.adjustsImageWhenHighlighted = true
        }
        
        for button in numberButtonArray {
            button.layer.masksToBounds = true
            button.layer.cornerRadius = button.layer.bounds.height / 2
        }
        
        for button in operatorButtonArray {
            button.layer.masksToBounds = true
            button.layer.cornerRadius = button.layer.bounds.height / 2
        }
        
        setNumberLabelText(calculation.getNumber())
    }
    
    @IBAction func didTap(_ sender: UIButton) {
        switch sender {
        case clearButton:
            calculation.initNumber()
            initOperatorButton()
            currentOperator = .none
        case plusMinusButton:
            calculation.plusMinus()
        case percentageButton:
            calculation.percent()
        case divisionButton:
            setSelectedOperator(divisionButton)
            currentOperator = .division
        case multiplyButton:
            setSelectedOperator(multiplyButton)
            currentOperator = .multiply
        case minusButton:
            setSelectedOperator(minusButton)
            currentOperator = .minus
        case plusButton:
            setSelectedOperator(plusButton)
            currentOperator = .plus
        case equalButton: break
            
        case decimalSeparatorButton: break
            
        case zeroButton:
            switch currentOperator {
            case .plus: calculation.plus(0)
            case .minus: calculation.minus(0)
            case .multiply: calculation.multiply(0)
            case .division: calculation.division(0)
            case .none: calculation.combineNumberWith(0)
            }
            
            initOperatorButton()
        case oneButton:
            switch currentOperator {
            case .plus: calculation.plus(1)
            case .minus: calculation.minus(1)
            case .multiply: calculation.multiply(1)
            case .division: calculation.division(1)
            case .none: calculation.combineNumberWith(1)
            }
            
            initOperatorButton()
        case twoButton:
            switch currentOperator {
            case .plus: calculation.plus(2)
            case .minus: calculation.minus(2)
            case .multiply: calculation.multiply(2)
            case .division: calculation.division(2)
            case .none: calculation.combineNumberWith(2)
            }
            
            initOperatorButton()
        case threeButton:
            switch currentOperator {
            case .plus: calculation.plus(3)
            case .minus: calculation.minus(3)
            case .multiply: calculation.multiply(3)
            case .division: calculation.division(3)
            case .none: calculation.combineNumberWith(3)
            }
            
            initOperatorButton()
        case fourButton:
            switch currentOperator {
            case .plus: calculation.plus(4)
            case .minus: calculation.minus(4)
            case .multiply: calculation.multiply(4)
            case .division: calculation.division(4)
            case .none: calculation.combineNumberWith(4)
            }
            
            initOperatorButton()
        case fiveButton:
            switch currentOperator {
            case .plus: calculation.plus(5)
            case .minus: calculation.minus(5)
            case .multiply: calculation.multiply(5)
            case .division: calculation.division(5)
            case .none: calculation.combineNumberWith(5)
            }
            
            initOperatorButton()
        case sixButton:
            switch currentOperator {
            case .plus: calculation.plus(6)
            case .minus: calculation.minus(6)
            case .multiply: calculation.multiply(6)
            case .division: calculation.division(6)
            case .none: calculation.combineNumberWith(6)
            }
            
            initOperatorButton()
        case sevenButton:
            switch currentOperator {
            case .plus: calculation.plus(7)
            case .minus: calculation.minus(7)
            case .multiply: calculation.multiply(7)
            case .division: calculation.division(7)
            case .none: calculation.combineNumberWith(7)
            }
            
            initOperatorButton()
        case eightButton:
            switch currentOperator {
            case .plus: calculation.plus(8)
            case .minus: calculation.minus(8)
            case .multiply: calculation.multiply(8)
            case .division: calculation.division(8)
            case .none: calculation.combineNumberWith(8)
            }
            
            initOperatorButton()
        case nineButton:
            switch currentOperator {
            case .plus: calculation.plus(9)
            case .minus: calculation.minus(9)
            case .multiply: calculation.multiply(9)
            case .division: calculation.division(9)
            case .none: calculation.combineNumberWith(9)
            }
            
            initOperatorButton()
        default:
            print("Unidentified Button")
        }
        
        setNumberLabelText(calculation.getNumber())
    }
    
    private func setSelectedOperator(_ selectedOperator: UIButton) {
        let orangeColor = #colorLiteral(red: 0.9897866845, green: 0.6272119284, blue: 0.04270292073, alpha: 1)
        
        for button in operatorButtonArray {
            UIView.animate(withDuration: 0.3) {
                button.backgroundColor = orangeColor
                button.tintColor = .white
            }
        }
        
        UIView.animate(withDuration: 0.3) {
            selectedOperator.backgroundColor = .white
            selectedOperator.tintColor = orangeColor
        }
    }
    
    private func initOperatorButton() {
        let orangeColor = #colorLiteral(red: 0.9897866845, green: 0.6272119284, blue: 0.04270292073, alpha: 1)
        
        for button in operatorButtonArray {
            UIView.animate(withDuration: 0.3) {
                button.backgroundColor = orangeColor
                button.tintColor = .white
            }
        }
    }
    
    private func setNumberLabelText(_ number: Double) {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 3
        
        let formattedNumberString = formatter.string(from: number as NSNumber)
        
        numberLabel.text = formattedNumberString
    }
    
}
