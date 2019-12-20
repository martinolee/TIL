//
//  Data.swift
//  ShoppingItems
//
//  Created by Soohan Lee on 2019/12/19.
//  Copyright © 2019 giftbot. All rights reserved.
//

import Foundation

struct Item {
    let productName: String
    let imageName: String
    let releasedYear: Int
    var tag: Int
    var userWantedStocks: Int
    let remainingStocks: Int
}

var itemList = [Item]()
