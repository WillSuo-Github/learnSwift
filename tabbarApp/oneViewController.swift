//
//  oneViewController.swift
//  learnSwift
//
//  Created by ws on 2016/10/16.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

class oneViewController: UIViewController {

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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let cells = tableView.visibleCells
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableView.bounds.size.height)
        }
        
        for (index, cell) in cells.enumerated() {
            UIView.animate(withDuration: 1 + (Double(index) / 2), animations: {
                cell.transform = CGAffineTransform.identity
                
            })
        }
    }
    


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension oneViewController: UITableViewDelegate, UITableViewDataSource {
    
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor =  colorforIndex(index: indexPath.row)
    }

    
    func colorforIndex(index: Int) -> UIColor {
        
        let itemCount = tableData.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: color, green: 0.0, blue: 1.0, alpha: 1.0)
        
    }
    
}


