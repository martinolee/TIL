//
//  DominoTabBarController.swift
//  DominoStarter
//
//  Created by Soohan Lee on 2019/12/27.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

enum TabBarItemTag: Int {
    case productsViewController = 101
    case wishListViewController = 102
}

class DominoTabBarController: UITabBarController {
    var dominoImageView: UIImageView!
    var wishListImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarImageView()
    }
    
    func setupTabBarImageView() {
        let dominoItemView = tabBar.subviews.first!
        dominoImageView = dominoItemView.subviews.first as? UIImageView
        dominoImageView.contentMode = .center
        
        let wishListItemView = self.tabBar.subviews[1]
        self.wishListImageView = wishListItemView.subviews.first as? UIImageView
        self.wishListImageView.contentMode = .center
    }
    
    private func animate(_ imageView: UIImageView) {
        UIView.animate(withDuration: 0.1, animations: {
            imageView.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
        }) { _ in
            UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 3.0, options: .curveEaseInOut, animations: {
                imageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: nil)
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let tabBarItemTag = TabBarItemTag(rawValue: item.tag) else { return }
        
        switch tabBarItemTag {
        case .productsViewController:
            animate(dominoImageView)
        case .wishListViewController:
            animate(wishListImageView)
        }
    }
    
}
