//
//  ViewController.swift
//  Task
//
//  Created by Soohan Lee on 2020/01/07.
//  Copyright © 2020 Soohan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var runningType = RunningType.touchesBegan
    
    private var touchCount = 0 {
        didSet {
            countLabel.text = "\(touchCount)"
        }
    }
    
    private var previousPoint: CGPoint?
    
    @IBOutlet weak var runningTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var coordinateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTapGesture()
        setupTapGestureUsingDelegate()
        
        countLabel.text = "\(touchCount)"
    }
    
    @IBAction func segmentedConrtrolValueChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == RunningType.touchesBegan.rawValue {
            runningType = .touchesBegan
        } else if sender.selectedSegmentIndex == RunningType.recognizer.rawValue {
            runningType = .recognizer
        } else if sender.selectedSegmentIndex == RunningType.delegate.rawValue {
            runningType = .delegate
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if runningType != .touchesBegan { return }
        
        let touch = touches.first
        let currentPoint = touch!.location(in: self.view)
        
        let formattedCurrentXPoint = String(format: "%.01f", currentPoint.x)
        let formattedCurrentYPoint = String(format: "%.01f", currentPoint.y)
        
        if previousPoint != nil { checkDistance(currentPoint, previousPoint!) }
        
        coordinateLabel.text = "(\(formattedCurrentXPoint), \(formattedCurrentYPoint))"
        
        self.previousPoint = currentPoint
    }
    
    @objc
    private func getTouchedPoint(_ sender: UITapGestureRecognizer) {
        guard runningType == .recognizer else { return }
        
        let currentPoint = sender.location(in: sender.view)
        
        let formattedCurrentXPoint = String(format: "%.01f", currentPoint.x)
        let formattedCurrentYPoint = String(format: "%.01f", currentPoint.y)
        
        if previousPoint != nil { checkDistance(currentPoint, previousPoint!) }
        
        coordinateLabel.text = "(\(formattedCurrentXPoint), \(formattedCurrentYPoint))"
        
        self.previousPoint = currentPoint
    }
    
    func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(getTouchedPoint(_:))
        )
        
        view.addGestureRecognizer(tapGesture)
    }
    
    func setupTapGestureUsingDelegate() {
        let tapGestureUsingDelegate = UITapGestureRecognizer()
        
        view.addGestureRecognizer(tapGestureUsingDelegate)
        tapGestureUsingDelegate.delegate = self
    }
    
    func checkDistance(_ currentPoint: CGPoint, _ previousPoint: CGPoint) {
        let xDistance = abs(currentPoint.x - previousPoint.x)
        let yDistance = abs(currentPoint.y - previousPoint.y)
        
        let isCloserThanTen = (pow(xDistance, 2) + pow(yDistance, 2)).squareRoot() <= 10
        
        if isCloserThanTen {
            touchCount += 1
        } else {
            touchCount = 1
        }
    }
    
}

extension ViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        guard runningType == .delegate else { return false }
        
        let currentPoint = touch.location(in: self.view)
        
        let isSegmentedControlArea = runningTypeSegmentedControl.frame.contains(currentPoint)
        
        if isSegmentedControlArea { return false }
        
        let formattedCurrentXPoint = String(format: "%.01f", currentPoint.x)
        let formattedCurrentYPoint = String(format: "%.01f", currentPoint.y)
        
        if previousPoint != nil { checkDistance(currentPoint, previousPoint!) }
        
        coordinateLabel.text = "(\(formattedCurrentXPoint), \(formattedCurrentYPoint))"
        
        self.previousPoint = currentPoint
        
        return true
    }
    
}

enum RunningType: Int {
    case touchesBegan = 0
    case recognizer = 1
    case delegate = 2
}
