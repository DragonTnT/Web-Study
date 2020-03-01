//
//  CollectionViewCell.swift
//  SelfSizingCell
//
//  Created by Erwin on 2020/3/1.
//  Copyright © 2020 Erwin. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.backgroundColor = UIColor.systemPink
        
        contentView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -20).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3).isActive = true
        label.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -6).isActive = true
        label.numberOfLines = 0
    }
    
    let label: UILabel = {
        let it = UILabel()
        it.textColor = .yellow
        return it
    }()
}
