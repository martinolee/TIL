//
//  CustomTableViewCell.swift
//  Task
//
//  Created by Soohan Lee on 2019/12/19.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

protocol CustomTableViewCellDelegate {
    func didTapButton(_ sender: UIButton)
}

class CustomTableViewCell: UITableViewCell {
    
    var delegate: CustomTableViewCellDelegate?
    
    static let identifier = "CustomTableViewCell"
    
    let numberLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Plus", for: .normal)
        button.titleLabel?.textColor = .label
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        plusButton.addTarget(self, action: #selector(touchUpInside(_:)), for: .touchUpInside)
        
        addSubview(plusButton)
        addSubview(numberLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupPlusButtonConstraints()
        setupNumberLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func touchUpInside(_ sender: UIButton) {
        delegate?.didTapButton(sender)
    }
    
    func setupNumberLabelConstraints() {
        let constraints = [
            numberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            numberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            numberLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            numberLabel.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setupPlusButtonConstraints() {
        let constraints = [
            plusButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            plusButton.trailingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 350),
            plusButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
