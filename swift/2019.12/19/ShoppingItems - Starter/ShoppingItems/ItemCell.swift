//
//  ItemCell.swift
//  ShoppingItems
//
//  Created by giftbot on 2019. 12. 17..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

protocol ItemCellDelegate {
    func touchUpInside(_ sender: UIButton)
}

final class ItemCell: UITableViewCell {
    
    static let identifier = "ItemCell"
    
    var delegate: ItemCellDelegate?
  
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var stockLabel: UILabel!
    @IBOutlet weak var addStockButton: UIButton!
    
    @IBAction func touchUpInsideAddStockButton(_ sender: UIButton) {
        delegate?.touchUpInside(sender)
    }
    
}
