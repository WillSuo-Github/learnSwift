//
//  TableViewController.swift
//  learnSwift
//
//  Created by ws on 2016/10/12.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    var transitionManager = MenuTransitionManager()
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configSubViews()
    }
    
    private func configSubViews(){
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .Done, target: self, action: #selector(TableViewController.menuBtnChick))
        
        tableView = {
            
            let t: UITableView = UITableView(frame: view.bounds)
            t.delegate = self
            t.dataSource = self
            view.addSubview(t)
            return t
        }()
    }
    
    func menuBtnChick() {
        
        let menuVc = MenuTableViewController()
        navigationController?.delegate = self
        navigationController?.pushViewController(menuVc, animated: true)
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
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
        
        cell!.textLabel?.text = "123"
        
        return cell!
    }
}

extension TableViewController: UINavigationControllerDelegate {
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if operation == .Push {
           transitionManager.isPush = true
        }else{
            transitionManager.isPush = false
        }
        
        return transitionManager
    }
}

