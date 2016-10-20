
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

        view.backgroundColor = UIColor.purple
        let _: UITableView = {
            
            let t: UITableView = UITableView(frame: view.bounds)
            t.delegate = self
            t.dataSource = self
            t.tableFooterView = UIView(frame: CGRect.zero)
            view.addSubview(t)
            return t
        }()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
}


extension MenuTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }
        
        cell!.backgroundColor = UIColor.clear
        
        cell!.textLabel?.text = "1"
        cell?.backgroundColor = .red
        
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        navigationController!.popViewController(animated: true)
    }
}
