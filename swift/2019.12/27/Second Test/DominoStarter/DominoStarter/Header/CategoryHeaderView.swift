//
//  CategoryHeaderView.swift
//  DominoStarter
//
//  Created by Soohan Lee on 2019/12/27.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class CategoryHeaderView: UITableViewHeaderFooterView {
    
    static let identifier = "CategoryHeaderView"
    
    let categoryImageView = UIImageView()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        
        categoryImageView.contentMode = .scaleAspectFit
        
        contentView.addSubview(categoryImageView)
        
        NSLayoutConstraint.activate([
            categoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
}
