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
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu"), style: .done, target: self, action: #selector(TableViewController.menuBtnChick))
        
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

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
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
        
        cell!.textLabel?.text = "123"
        
        return cell!
    }

}

extension TableViewController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            transitionManager.isPush = true
        }else{
            transitionManager.isPush = false
        }
        
        return transitionManager
    }
}

