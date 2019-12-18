//
//  TableViewMultipleSelection.swift
//  TableViewPractice
//
//  Created by giftbot on 2019/12/05.
//  Copyright © 2019 giftbot. All rights reserved.
//

import UIKit

final class TableViewMultipleSelection: UIViewController {
    
    /***************************************************
     [ 실습 - TableViewRefresh 기능을 이어서 수행 ]
     
     1) 처음 화면에 띄워질 목록은 1부터 지정한 숫자까지의 숫자들을 출력
     2) 이후 갱신할 때마다 임의의 숫자들이 출력되도록 할 것
     랜덤 숫자의 범위는 출력할 숫자 개수의 +50 이며, 모든 숫자는 겹치지 않아야 함.
     (여기까지 TableViewRefresh 실습 내용과 동일)
     3) 특정 테이블뷰셀을 선택하고 갱신하면 해당 셀에 있던 숫자는 유지되고 나머지 숫자들만 랜덤하게 갱신되도록 처리
     (셀을 선택한 순서에 따라 그대로 다음 갱신 목록에 출력)
     e.g. 20, 10 두 개의 숫자를 선택하고 갱신하면, 다음 숫자 목록은 (20, 10, random, random...)
     4) 위 3번에서 숫자를 선택할 때 그 숫자가 7보다 작은 셀은 선택이 되지 않도록 처리.
     
     < 힌트 키워드 >
     willSelectRowAt - scrollViewDelegate 참고, 선택 가능 여부
     selectedRow(s) - tableView 속성, 현재 선택된 행에 대한 정보
     multipleSelection - 다중 선택 가능 여부
     ***************************************************/
    
    private let cellCount = 40
    private let numberRange = 50
    private let refreshControl = UIRefreshControl()
    
    override var description: String {
        return "Task 1 - MultipleSelection"
    }
    
    let tableView = UITableView()
    
    lazy var numbers = Array(1...cellCount + numberRange)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    func setupTableView() {
        tableView.frame = view.frame
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "RandomNumberCell")
        
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(randomNumbers), for: .valueChanged)
        
        tableView.allowsMultipleSelection = true
        
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
    }
    
    @objc
    func randomNumbers() {
        var highPriorityNumbers = [Int]()
        
        var selectedRows = tableView.indexPathsForSelectedRows
        
        selectedRows?.sort(by: { (i, j) -> Bool in
            i > j
        })
        
        for selectedRow in selectedRows ?? [] {
            highPriorityNumbers.append(Int(tableView.cellForRow(at: selectedRow)!.textLabel!.text!)!)
        }
        
        numbers = Array(0...cellCount + numberRange)
        numbers.shuffle()
        
        for highPriorityNumber in highPriorityNumbers {
            for i in 0 ..< numbers.count {
                if numbers[i] == highPriorityNumber {
                    numbers.remove(at: i)
                    numbers.insert(highPriorityNumber, at: 0)
                    break
                }
            }
        }
        
        
        numbers = Array(numbers.dropLast(50))
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
}

// MARK: - UITableViewDataSource

extension TableViewMultipleSelection: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RandomNumberCell", for: indexPath)
        
        cell.textLabel?.text = "\(numbers[indexPath.row])"
        
        return cell
    }
    
}

extension TableViewMultipleSelection: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row < 3 && Int(tableView.cellForRow(at: indexPath)!.textLabel!.text!)! < 7 {
            return nil
        }
        
        return indexPath
    }
}
