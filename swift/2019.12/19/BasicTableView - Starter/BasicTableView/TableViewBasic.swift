//
//  TableViewBasic.swift
//  BasicTableView
//
//  Created by Giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewBasic: UIViewController {
  
  override var description: String { "TableView - Basic" }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let tableView = UITableView(frame: view.frame)
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    
    tableView.dataSource = self
    
    view.addSubview(tableView)
  }
}

extension TableViewBasic: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "CellID")
//        cell.textLabel?.text = "\(indexPath.row)"
//        return cell
        
        
//        let cell: UITableViewCell
//        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "Cell") {
//            cell = reusableCell
//            print("reuse")
//        } else {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
//            print("creat")
//        }
//
//        cell.textLabel?.text = "\(indexPath.row)"
//        return cell
        
        
        let reusableCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        reusableCell.textLabel?.text = "\(indexPath.row)"
        
        return reusableCell
    }
    
}



