//
//  TableViewSection.swift
//  TableViewPractice
//
//  Created by giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewSection: UIViewController {
    
    /***************************************************
     Data :  0 부터  100 사이에 임의의 숫자
     섹션 타이틀을 10의 숫자 단위로 설정하고 각 섹션의 데이터는 해당 범위 내의 숫자들로 구성
     e.g.
     섹션 0 - 0부터 9까지의 숫자
     섹션 1 - 10부터 19까지의 숫자
     ***************************************************/
    
    override var description: String { "Practice 2 - Section" }
    
//      let data = [5, 7, 16, 19, 22, 29, 30, 39, 44, 48, 50]
    let data = Array(0...100)
    
    var sortedData = [[Int]]()
    
    var sectionNames = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.frame)
        
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SortedNumberCell")
        
        view.addSubview(tableView)
        
        let uniqueData = Array(Set(data)).sorted()
        
        for element in uniqueData { sectionNames.append(element / 10) }
        
        sectionNames = Array(Set(sectionNames)).sorted()
        
        sortedData = sectionNames.map { digit in
            return uniqueData.filter { (number) -> Bool in
                return number / 10 == digit
            }
        }
    }
}


// MARK: - UITableViewDataSource

extension TableViewSection: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(sectionNames[section])"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionNames.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SortedNumberCell", for: indexPath)
        
        cell.textLabel?.text = "\(sortedData[indexPath.section][indexPath.row])"
        
        return cell
    }
}
