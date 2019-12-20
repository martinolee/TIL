//
//  TableViewAccessoryType.swift
//  TableViewPractice
//
//  Created by giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewAccessoryType: UIViewController {
    
    /***************************************************
     - 미리 정해진 동물의 이미지와 텍스트를 테이블뷰에 표현
     - 각 셀의 크기는 80
     - 셀을 선택하면 체크박스가 나타나고 다시 선택하면 체크표시가 해제되도록 구현
     
     도전 과제)
     테이블뷰의 각 셀을 위아래로 스크롤 했다가 다시 나타낼 때, 체크 표시가 기존에 했던 곳에 정확히 다시 나타나도록 구현
     ***************************************************/
    
    override var description: String {
        return "Task 2 - AccessoryType"
    }
    
    let animals = [
        "bear", "buffalo", "camel", "dog", "elephant",
        "koala", "llama", "panda", "lion", "horse",
        "guinea_pig", "koala", "whale_shark", "whale", "duck",
        "seagull", "black_swan", "peacock", "giraffe"
    ]
    
    private lazy var selectedAnimals = Array(repeating: false, count: animals.count)
    
    let animalTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.allowsMultipleSelection = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "AnimalCell")
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAnimalTableView()
    }
    
    private func setupAnimalTableView() {
        animalTableView.dataSource = self
        animalTableView.delegate = self
        
        view.addSubview(animalTableView)
        
        NSLayoutConstraint.activate([
            animalTableView.topAnchor   .constraint(equalTo: self.view.topAnchor   ),
            animalTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            animalTableView.rightAnchor .constraint(equalTo: self.view.rightAnchor ),
            animalTableView.leftAnchor  .constraint(equalTo: self.view.leftAnchor  ),
        ])
    }
}


extension TableViewAccessoryType: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalCell", for: indexPath)
        let target = indexPath.row
        
        cell.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        cell.textLabel?.text = animals[target]
        cell.imageView?.image = UIImage(named: animals[target])
        
        if selectedAnimals[indexPath.row] {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
}

extension TableViewAccessoryType: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedAnimals[indexPath.row] = true
        tableView.cellForRow(at: indexPath)!.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        selectedAnimals[indexPath.row] = false
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
        
}
