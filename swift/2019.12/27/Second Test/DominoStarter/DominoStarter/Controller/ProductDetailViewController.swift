//
//  ProductDetailViewController.swift
//  DominoStarter
//
//  Created by Soohan Lee on 2019/12/27.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    var selectedCellIndexPath: IndexPath!
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productQuantityLabel: UILabel!
    
    @IBOutlet weak var plusProductQuantityButton: UIButton!
    @IBOutlet weak var minusProductQuantityButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackBarButton()
        setupProductQuantityLabel()
    }
    
    func setupBackBarButton() {
        let category = menuCategorys[selectedCellIndexPath.section]
        
        navigationController?.navigationBar.topItem?.title = category
    }
    
    func setupProductQuantityLabel() {
        productQuantityLabel.font = UIFont.systemFont(ofSize: 25)
        productQuantityLabel.layer.masksToBounds = true
        productQuantityLabel.layer.cornerRadius = 8
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = menuProducts[selectedCellIndexPath.section][selectedCellIndexPath.row].name
        
        productImageView.image = UIImage(named: menuProducts[selectedCellIndexPath.section][selectedCellIndexPath.row].name)
        
        productQuantityLabel.text = "\(menuProducts[selectedCellIndexPath.section][selectedCellIndexPath.row].quantity) 개"
    }
    
    @IBAction func plusProductQuantity(_ sender: UIButton) {
        menuProducts[selectedCellIndexPath.section][selectedCellIndexPath.row].quantity += 1
        
        productQuantityLabel.text = "\(menuProducts[selectedCellIndexPath.section][selectedCellIndexPath.row].quantity) 개"
    }
    
    @IBAction func minusProductQuantity(_ sender: UIButton) {
        let hasMoreThanOne = menuProducts[selectedCellIndexPath.section][selectedCellIndexPath.row].quantity > 0
        
        if hasMoreThanOne { menuProducts[selectedCellIndexPath.section][selectedCellIndexPath.row].quantity -= 1 }
        
        productQuantityLabel.text = "\(menuProducts[selectedCellIndexPath.section][selectedCellIndexPath.row].quantity) 개"
    }
}
