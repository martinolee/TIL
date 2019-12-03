//
//  NextViewController.swift
//  Task
//
//  Created by Soohan Lee on 2019/12/03.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image
    }
    
    @IBAction func plusAll(_ sender: Any) {
        guard let mainVC = presentingViewController as? ViewController else { return }
        
        if mainVC.animalCount[0] < 8  { mainVC.animalCount[0] += 1 }
        if mainVC.animalCount[1] < 10 { mainVC.animalCount[1] += 1 }
        if mainVC.animalCount[2] < 15 { mainVC.animalCount[2] += 1 }
    }
    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

extension UIImage {
    func load(url: URL) -> UIImage? {
        if let data = try? Data(contentsOf: url) {
            if let image = UIImage(data: data) {
                return image
            }
        }
        return nil
    }
}
