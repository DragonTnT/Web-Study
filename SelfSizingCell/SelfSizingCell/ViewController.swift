//
//  ViewController.swift
//  SelfSizingCell
//
//  Created by Erwin on 2020/3/1.
//  Copyright © 2020 Erwin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
       
        
    }
    
    lazy var tableView: UITableView = {
        let it = UITableView(frame: self.view.bounds)
        it.dataSource = self
        it.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        it.rowHeight = 120
        return it
    }()
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        return cell
    }
}




