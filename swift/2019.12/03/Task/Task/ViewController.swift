//
//  ViewController.swift
//  Task
//
//  Created by Soohan Lee on 2019/12/03.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animalCountLabel: UILabel!
    
    var animalCount = [0, 0, 0] {
        didSet {
            animalCountLabel.text = "\(animalCount)"
        }
    }
    
    var dogImage: UIImage?
    var catImage: UIImage?
    var birdImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animalCountLabel.text = "\(animalCount)"
        dogImage = UIImage().load(url: NSURL(string: "https://www.thesprucepets.com/thmb/MpaDZnwwSVHwTg3Go6INiJuEptM=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/31970492_155701338614209_1862210485680603136_n-5b3a54a546e0fb0037aaacf1.jpg")! as URL)
        
        catImage = UIImage().load(url: NSURL(string: "https://cdn.pixabay.com/photo/2016/06/04/14/09/cat-1435590_960_720.jpg")! as URL)
        
        birdImage = UIImage().load(url: NSURL(string: "https://images.fineartamerica.com/images-medium-large/bald-eagle-vertical-evelyn-peyton.jpg")! as URL)
    }

    @IBAction func unwindToView(_ unwindSegue: UIStoryboardSegue) {
        let _ = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
        
        if identifier == Animal.Dog {
            if animalCount[0] < 8 { return true }
        } else if identifier == "Cat" {
            if animalCount[1] < 10 { return true }
        } else if identifier == "Bird" {
            if animalCount[2] < 15 { return true }
        }
        
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let nextVC = segue.destination as? NextViewController else { return }
        
        if segue.identifier == "Dog" {
            animalCount[0] += 1
            
            nextVC.image = dogImage
        } else if segue.identifier == "Cat" {
            animalCount[1] += 1
            
            nextVC.image = catImage
        } else if segue.identifier == "Bird" {
            animalCount[2] += 1
            
            nextVC.image = birdImage
        }
    }

}

enum Animal {
    case Dog, Cat, Bird
}
