//
//  WishListViewController.swift
//  DominoStarter
//
//  Created by Soohan Lee on 2019/12/27.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController {
    
    var wishList = [Product]()
    
    @IBOutlet var wishListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wishListTableView.dataSource = self
        wishListTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateWishList()
    }
    
    func resetWishList() {
        wishList.removeAll()
        
        for section in 0 ..< menuProducts.count {
            for row in 0 ..< menuProducts[section].count {
                menuProducts[section][row].quantity = 0
            }
        }
        
        wishListTableView.reloadData()
    }
    
    @IBAction func resetWishList(_ sender: UIBarButtonItem) {
        resetWishList()
    }
    
    @IBAction func order(_ sender: UIBarButtonItem) {
        if wishList.isEmpty { return }
        
        var orderProductsList = ""
        var orderProductsPrice = 0
        
        for product in wishList {
            orderProductsList += "\(product.name) - \(product.quantity)개"
            orderProductsList += "\r"
            
            orderProductsPrice += product.price * product.quantity
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedPrice = numberFormatter.string(from: NSNumber(value: orderProductsPrice))!
        
        orderProductsList += "\r"
        orderProductsList += "결제금액: \(formattedPrice)원"
        
        let orderConfirmAlert = UIAlertController(title: "결제내역", message: orderProductsList, preferredStyle: .alert)
        
        orderConfirmAlert.addAction(UIAlertAction(title: "돌아가기", style: .cancel, handler: nil))
        orderConfirmAlert.addAction(UIAlertAction(title: "결제하기", style: .default, handler: { _ in
            self.resetWishList()
        }))
        
        present(orderConfirmAlert, animated: true, completion: nil)
    }
    
    func updateWishList() {
        wishList.removeAll()
        
        for category in menuProducts {
            for product in category {
                if product.quantity > 0 {
                    wishList.append(product)
                }
            }
        }
        
        wishListTableView.reloadData()
    }
    
}

extension WishListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wishList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WishListTableViewCell.identifier, for: indexPath) as! WishListTableViewCell
        let product = wishList[indexPath.row]
        
        cell.productImageView.image = UIImage(named: product.name)
        cell.productNameLabel.text = product.name
        cell.productQuantityLabel.text = "\(product.quantity) 개"
        
        return cell
    }
    
}

extension WishListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 100 }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.setSelected(false, animated: true)
    }
}
