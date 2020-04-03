//
//  MVCCalculatorViewController.swift
//  RxfulCalculator
//
//  Created by Soohan Lee on 2020/04/03.
//  Copyright © 2020 Soohan Lee. All rights reserved.
//

import UIKit

final class MVCCalculatorViewController: UIViewController {
  // MARK: - Properties
  
  let model = CalculatingModel()
  
  private lazy var calculatorView = MVCCalculatorView().then {
    $0.delegate = self
  }
  
  // MARK: - Life Cycle
  
  override func loadView() {
    view = calculatorView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

extension MVCCalculatorViewController: MVCCalculatorViewDeleate {
  func lhsTextFieldEditingDidChange(_ textField: UITextField, _ text: String) {
    model.lhs = Int(text)
    
    guard let result = model.result else { return }
    
    calculatorView.setResultLabelText("\(result)")
  }
  
  func rhsTextFieldEditingDidChange(_ textField: UITextField, _ text: String) {
    model.rhs = Int(text)
    
    guard let result = model.result else { return }
    
    calculatorView.setResultLabelText("\(result)")
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let allowedCharacters = CharacterSet.decimalDigits
    let characterSet = CharacterSet(charactersIn: string)
    
    return allowedCharacters.isSuperset(of: characterSet)
  }
}
