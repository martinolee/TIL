//
//  TouchViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 2020/01/04.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class TouchViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    private var isFirstCat = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configImageView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        guard let touch = touches.first else { return }

        let touchPoint = touch.location(in: touch.view)
        
        imageView.center = touchPoint
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        guard let touch = touches.first else { return }

        let touchPoint = touch.location(in: touch.view)
        
        imageView.center = touchPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
    }
    
    private func configImageView() {
        imageView.layer.masksToBounds = true // or imageView.clipsToBounds
        imageView.layer.cornerRadius = imageView.frame.width / 2
    }
    
}



