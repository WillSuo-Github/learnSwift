//
//  TableViewController.swift
//  learnSwift
//
//  Created by ws on 2016/10/11.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    var tableData = ["Personal Life", "Buddy Company", "#30 days Swift Project", "Body movement training", "AppKitchen Studio", "Project Read", "Others" ]
    private var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView(frame: view.bounds)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
        
        let cellArr = tableView.visibleCells
       
        
        for (index, c) in cellArr.enumerated() {
            let cell: UITableViewCell = c as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableView.bounds.size.height)
            UIView.animate(withDuration: 2, delay: 0.05 * Double(index), usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .curveEaseIn, animations: { 
                cell.transform = CGAffineTransform.identity
                }, completion: nil)
        }
        
    }
    
    
    

}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.backgroundColor = .red
        cell?.textLabel?.text = tableData[indexPath.row]
        return cell!
    }
    
    
    func colorforIndex(_ index: Int) -> UIColor {
        
        let itemCount = tableData.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: color, green: 0.0, blue: 1.0, alpha: 1.0)
        
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor =  colorforIndex(indexPath.row)
    }
}
