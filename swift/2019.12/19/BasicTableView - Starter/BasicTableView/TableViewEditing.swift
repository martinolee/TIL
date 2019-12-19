//
//  TableViewEditing.swift
//  BasicTableView
//
//  Created by Giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewEditing: UIViewController {
    
    /***************************************************
     테이블뷰 목록 수정하기 (insert, delete 등)
     ***************************************************/
    
    override var description: String { "TableView - Editing" }
    
    let tableView = UITableView()
    var data = Array(1...50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Edit", style: .plain, target: self, action: #selector(switchToEditing)
        )
    }
    
    func setupTableView() {
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        view.addSubview(tableView)
        
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing...")
        refreshControl.tintColor = .blue
        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc func reloadData() {
        tableView.refreshControl?.endRefreshing()
        tableView.reloadData()
    }
    
    @objc func switchToEditing() {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension TableViewEditing: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = "\(data[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .none:
            print("none")
        case .insert:
            data.insert(Int.random(in: 1...50), at: indexPath.row)
            tableView.insertRows(at: [indexPath], with: .right)
            print("insert")
        case .delete:
            data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            print("delete")
        default:
            print("default")
        }
    }
    
}


// MARK: - UITableViewDelegate

extension TableViewEditing: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        (indexPath.row + 1).isMultiple(of: 2)
    }
    
    
    // in iOS 8 ~ iOS 10 only available for traling
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        return []
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.row % 3 == 0 {
            return .none
        } else if indexPath.row % 3 == 1 {
            return .delete
        } else {
            return .insert
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let addAction = UIContextualAction(style: .normal, title: "Add") { (action, sourceView, actionPerformed) in
            print("add action")
            
            actionPerformed(true)
        }
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, actionPerformed) in
            print("delete action")
            
            actionPerformed(true)
        }
        
        return UISwipeActionsConfiguration(actions: [addAction, deleteAction])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let addAction = UIContextualAction(style: .normal, title: "Add") { (action, sourceView, actionPerformed) in
            print("add action")
            
            actionPerformed(true)
        }
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, actionPerformed) in
            print("delete action")
            
            actionPerformed(true)
        }
        
        return UISwipeActionsConfiguration(actions: [addAction, deleteAction])
    }
    
}

