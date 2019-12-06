//
//  Data.swift
//  Task
//
//  Created by Soohan Lee on 2019/12/06.
//  Copyright © 2019 Soohan. All rights reserved.
//

import Foundation

class Data {
    static let shared = Data()
    
    var text = ""
    
    private init() {}
}

class Key {
    static var text = "Text"
}
