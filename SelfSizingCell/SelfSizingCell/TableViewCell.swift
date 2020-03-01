//
//  TableViewCell.swift
//  SelfSizingCell
//
//  Created by Erwin on 2020/3/1.
//  Copyright © 2020 Erwin. All rights reserved.
//

import UIKit

protocol CellChangeNeedRefresh: class {
    func needRefresh()
}

class TableViewCell: UITableViewCell {
    
    weak var delegate: CellChangeNeedRefresh?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        contentView.addSubview(collectionView)
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
        //接下来根据collectionView的内容改变它的高度
        collectionView.frame.size = collectionView.collectionViewLayout.collectionViewContentSize
        
        //接下来根据每个cell里collectionView的高度，计算出该cell的高度，再计算服务列表tableView的高度，最后得出整个大cell会员套餐的高度
    }

    lazy var collectionView: UICollectionView = {
        let layout = LeftAlignedCollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let frame = CGRect(x: 30, y: 20, width: 200, height: 200)
        let it = UICollectionView(frame: frame, collectionViewLayout: layout)
        it.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        it.dataSource = self
        
        return it
    }()

}

extension TableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.label.text = dataList[indexPath.item]
        return cell
    }
}

private let dataList: [String] = ["12331","23","你好吗","acxcsdsads"]
