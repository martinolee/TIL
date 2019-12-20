//
//  ViewController.swift
//  ShoppingItems
//
//  Created by giftbot on 2019. 12. 17..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareItems()
    }
    
    private func prepareItems() {
        itemList.append(Item(
            productName: "iPhone 4",
            imageName: "iPhone 4",
            releasedYear: 2010,
            tag: 0,
            userWantedStocks: 0,
            remainingStocks: 10)
        )
        
        itemList.append(Item(
            productName: "iPhone 4S",
            imageName: "iPhone 4S",
            releasedYear: 2011,
            tag: 1,
            userWantedStocks: 0,
            remainingStocks: 10)
        )
        
        itemList.append(Item(
            productName: "iPhone 5",
            imageName: "iPhone 5",
            releasedYear: 2012,
            tag: 2,
            userWantedStocks: 0,
            remainingStocks: 10)
        )
        
        itemList.append(Item(
            productName: "iPhone 5S",
            imageName: "iPhone 5S",
            releasedYear: 2013,
            tag: 3,
            userWantedStocks: 0,
            remainingStocks: 10)
        )
        
        itemList.append(Item(
            productName: "iPhone 7",
            imageName: "iPhone 7",
            releasedYear: 2016,
            tag: 4,
            userWantedStocks: 0,
            remainingStocks: 10)
        )
        
        itemList.append(Item(
            productName: "iPhone X",
            imageName: "iPhone X",
            releasedYear: 2017,
            tag: 5,
            userWantedStocks: 0,
            remainingStocks: 10)
        )
        
        itemList.append(Item(
            productName: "iPhone XS",
            imageName: "iPhone XS",
            releasedYear: 2018,
            tag: 6,
            userWantedStocks: 0,
            remainingStocks: 10)
        )
        
        itemList.append(Item(
            productName: "iPhone 11",
            imageName: "iPhone 11",
            releasedYear: 2019,
            tag: 7,
            userWantedStocks: 0,
            remainingStocks: 10)
        )
        
        itemList.append(Item(
            productName: "iPhone 11 Pro",
            imageName: "iPhone 11 Pro",
            releasedYear: 2019,
            tag: 8,
            userWantedStocks: 0,
            remainingStocks: 10)
        )
        
        itemList.sort { (firstItem, secondItem) -> Bool in
            firstItem.releasedYear < secondItem.releasedYear
        }
    }
    
    
    
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.identifier, for: indexPath) as! ItemCell
        let target = indexPath.row
        
        cell.delegate = self
        cell.itemImageView.image = UIImage(named: itemList[target].imageName)
        cell.productNameLabel.text = itemList[target].productName
        cell.stockLabel.text = "\(itemList[target].userWantedStocks)"
        cell.addStockButton.tag = itemList[target].tag
        cell.addStockButton.adjustsImageWhenHighlighted = true
        
        return cell
    }
}

extension ViewController: ItemCellDelegate {
    
    func touchUpInside(_ sender: UIButton) {
        let target = sender.tag
        
        if itemList[target].userWantedStocks < itemList[target].remainingStocks {
            itemList[sender.tag].userWantedStocks += 1
        } else {            
            UIView.animate(withDuration: 0.2) {
                self.tableView.cellForRow(at: IndexPath(indexes: [0, target]))?.backgroundColor = UIColor(red: 255/255, green: 0, blue: 0, alpha: 1)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                UIView.animate(withDuration: 0.2) {
                    self.tableView.cellForRow(at: IndexPath(indexes: [0, target]))?.backgroundColor = UIColor(red: 255/255, green: 0, blue: 0, alpha: 0)
                }
            }
            
        }
        
        tableView.reloadData()
    }
}
