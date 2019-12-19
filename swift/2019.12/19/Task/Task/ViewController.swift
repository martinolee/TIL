//
//  ViewController.swift
//  Task
//
//  Created by Soohan Lee on 2019/12/19.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var data = Array(1...100)
    
    private let numberTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        setupNumberTableView()
    }
    
    func setupNumberTableView() {
        numberTableView.dataSource = self
        
        numberTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        
        view.addSubview(numberTableView)
        
        NSLayoutConstraint.activate([
            numberTableView.topAnchor   .constraint(equalTo: self.view.topAnchor   ),
            numberTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            numberTableView.rightAnchor .constraint(equalTo: self.view.rightAnchor ),
            numberTableView.leftAnchor  .constraint(equalTo: self.view.leftAnchor  ),
        ])
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        cell.delegate = self
        cell.numberLabel.text = "\(data[indexPath.row])"
        cell.plusButton.tag = indexPath.row
        
        return cell
    }
    
}

extension ViewController: CustomTableViewCellDelegate {
    func didTapButton(_ sender: UIButton) {
        data[sender.tag] += 1
        numberTableView.reloadData()
    }
    
}
