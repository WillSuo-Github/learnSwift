
//
//  MenuTableViewController.swift
//  learnSwift
//
//  Created by ws on 2016/10/12.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

class MenuTableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.purpleColor()
        let _: UITableView = {
            
            let t: UITableView = UITableView(frame: view.bounds)
            t.delegate = self
            t.dataSource = self
            t.tableFooterView = UIView(frame: CGRectZero)
            view.addSubview(t)
            return t
        }()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
}


extension MenuTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        }
        
        cell!.backgroundColor = UIColor.clearColor()
        
        cell!.textLabel?.text = "1"
        cell?.backgroundColor = .redColor()
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        navigationController?.popViewControllerAnimated(true)
    }
}
