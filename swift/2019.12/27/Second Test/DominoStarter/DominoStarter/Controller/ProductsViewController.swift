//
//  ProductsViewController.swift
//  DominoStarter
//
//  Created by Soohan Lee on 2019/12/27.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {
    
    @IBOutlet var productTableView: UITableView!
    
    var selectedCellIndexPath: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarItem.tag = TabBarItemTag.productsViewController.rawValue
        
        productTableView.dataSource = self
        productTableView.delegate = self
        
        productTableView.register(CategoryHeaderView.self, forHeaderFooterViewReuseIdentifier: CategoryHeaderView.identifier)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailProductSegue" {
            let productDetailVC =  segue.destination as! ProductDetailViewController
            
            productDetailVC.selectedCellIndexPath = self.selectedCellIndexPath
        }
    }
    
}

extension ProductsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        menuProducts.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CategoryHeaderView.identifier) as! CategoryHeaderView
        
        headerView.categoryImageView.image = UIImage(named: menuCategorys[section])
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuProducts[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as! ProductTableViewCell
        let product = menuProducts[indexPath.section][indexPath.row]
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedPrice = numberFormatter.string(from: NSNumber(value: product.price))!
        
        cell.productImageView.image = UIImage(named: product.name)
        cell.productNameLabel.text = product.name
        cell.productPriceLabel.text = "\(formattedPrice)원"
        
        return cell
    }
    
}

extension ProductsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat { 80 }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 120 }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.setSelected(false, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedCellIndexPath = indexPath
        
        return indexPath
    }
    
}
