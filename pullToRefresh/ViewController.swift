//
//  ViewController.swift
//  pullToRefresh
//
//  Created by ws on 2016/10/7.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let oldEmoji = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"]
    let newEmoji = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ]
    var refreshControl = UIRefreshControl()
    var sourceData: [String]!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sourceData = oldEmoji
        
        refreshControl.addTarget(self, action: #selector(self.refreshData), for: .valueChanged)
        
        
        view.addSubview(tableVc.tableView)
        tableVc.refreshControl = refreshControl
    }
    
    func refreshData(){
        
        refreshControl.endRefreshing()
        sourceData = newEmoji
        tableVc.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    lazy var tableVc: UITableViewController = {
        let t: UITableViewController = UITableViewController()
        t.tableView.delegate = self
        t.tableView.dataSource = self
        return t
    }()
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = sourceData[indexPath.row]
        return cell!
    }
    
    
    
    
}




