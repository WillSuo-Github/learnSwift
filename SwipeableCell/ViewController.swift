//
//  ViewController.swift
//  SwipeableCell
//
//  Created by ws on 2016/10/16.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var data = [
        pattern(image: "1", name: "Pattern Building"),
        pattern(image: "2", name: "Joe Beez"),
        pattern(image: "3", name: "Car It's car"),
        pattern(image: "4", name: "Floral Kaleidoscopic"),
        pattern(image: "5", name: "Sprinkle Pattern"),
        pattern(image: "6", name: "Palitos de queso"),
        pattern(image: "7", name: "Ready to Go? Pattern"),
        pattern(image: "8", name: "Sets Seamless"),
        ]
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = {
            let table = UITableView(frame: view.bounds)
            table.delegate = self
            table.dataSource = self
            table.tableFooterView = UIView(frame: CGRect.zero)
            view.addSubview(table)
            return table
        }()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.imageView?.image = UIImage(named: data[indexPath.row].image)
        cell?.textLabel?.text = data[indexPath.row].name
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delegateAction = UITableViewRowAction(style: .default, title: "删除") { (action, indexPath) in
            print(action, indexPath)
        }
        
        return [delegateAction]
    }
    

}

