//
//  GestureViewController.swift
//  GestureRecognizerExample
//
//  Created by giftbot on 2020/01/04.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit
import AudioToolbox.AudioServices

final class GestureViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    
    private var isSecondCat = true
    private var isSmall = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configImageView()
        setupImageViewGesture()
        imageView.backgroundColor = .label
    }
    
    @objc
    private func toggleImageViewSize(_ sender: UITapGestureRecognizer) {
        let normalWidthAndHeight: CGFloat = 150
        let tempCenter = imageView.center
        if isSmall {
            imageView.frame.size = CGSize(width: normalWidthAndHeight, height: normalWidthAndHeight)
            imageView.center = tempCenter
        } else {
            imageView.frame.size = CGSize(width: normalWidthAndHeight * 2, height: normalWidthAndHeight * 2)
            imageView.center = tempCenter
        }
        
        isSmall.toggle()
        
        configImageView()
    }
    
    @objc
    private func moveImageView(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        
        if let view = sender.view {
          view.center = CGPoint(x: view.center.x + translation.x,
                                  y: view.center.y + translation.y)
        }
        
        sender.setTranslation(.zero, in: self.view)
    }
    
    @objc
    private func rotateImageView(_ sender: UIRotationGestureRecognizer) {
        let angle = sender.rotation
        let tr = CGAffineTransform.identity.rotated(by: angle)
        imageView.transform = tr
    }
    
    @objc
    private func changeCatImage(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            imageView.image = UIImage(named: "cat1")
            sender.direction = .right
        } else if sender.direction == .right {
            imageView.image = UIImage(named: "cat2")
            sender.direction = .left
        }
    }
    
    @objc
    private func vibrate(_ sender: UILongPressGestureRecognizer) {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    
    private func configImageView() {
        imageView.layer.masksToBounds = true // or imageView.clipsToBounds
        imageView.layer.cornerRadius = imageView.bounds.height / 2
    }
    
    private func setupImageViewGesture() {
        
        let doubleTapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(toggleImageViewSize(_:))
        )
        
        doubleTapGesture.numberOfTapsRequired = 2
        
        let panGesture = UIPanGestureRecognizer(
            target: self,
            action: #selector(moveImageView(_:))
        )
        
        let rotationGesture = UIRotationGestureRecognizer(
            target: self,
            action: #selector(rotateImageView(_:)))
        
        let swipeGesture = UISwipeGestureRecognizer(
            target: self,
            action: #selector(changeCatImage(_:)))
        
        let longPressGesture = UILongPressGestureRecognizer(
            target: self,
            action: #selector(vibrate(_:)))
        
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(doubleTapGesture)
        imageView.addGestureRecognizer(panGesture)
        view.addGestureRecognizer(rotationGesture)
        view.addGestureRecognizer(swipeGesture)
        view.addGestureRecognizer(longPressGesture)
    }
}
