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
            table.tableFooterView = UIView(frame: CGRectZero)
            view.addSubview(table)
            return table
        }()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell")
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        }
        cell?.imageView?.image = UIImage(named: data[indexPath.row].image)
        cell?.textLabel?.text = data[indexPath.row].name
        
        return cell!
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let delegateAction = UITableViewRowAction(style: .Default, title: "删除") { (action: UITableViewRowAction, indexPath: NSIndexPath) in
            print(action, indexPath)
        }
        
        return [delegateAction]
    }
}

