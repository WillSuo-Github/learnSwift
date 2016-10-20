//
//  ViewController.swift
//  CustomRefresh
//
//  Created by ws on 2016/10/13.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tableView = UITableView()
    var customRefresh = UIRefreshControl()
    var labelArr: Array<UILabel> = []
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = {
            let t: UITableView = UITableView(frame: view.bounds)
            t.delegate = self
            t.dataSource = self
            t.tableFooterView = UIView()
            view.addSubview(t)
            return t
        }()
        
        customRefresh = {
            let t: UIRefreshControl = UIRefreshControl()
            t.tintColor = .clear
            t.backgroundColor = .clear
            tableView.addSubview(t)
            return t
        }()
        
        configRefreshContentView()
    }
    
    private func configRefreshContentView() {
        let refreshContents = Bundle.main.loadNibNamed("contentView", owner: self, options: nil)
        let contentView = refreshContents?[0] as! UIView
        contentView.frame = customRefresh.bounds
        customRefresh.addSubview(contentView)
        for i in 0..<contentView.subviews.count {
            labelArr.append(contentView.viewWithTag(i + 1) as! UILabel)
        }
    }
    
    fileprivate func refreshStartAnimation() {
        
        
        UIView.animate(withDuration: 0.5, animations: { 
            self.labelArr[self.index].transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_4))
            self.labelArr[self.index].textColor = .red
            }) { (finished) in
                
                UIView.animate(withDuration: 0.5, animations: { 
                    self.labelArr[self.index].transform = CGAffineTransform.identity
                    self.labelArr[self.index].textColor = .black
                    }, completion: { (finished) in
                        self.index += 1
                        if self.index < self.labelArr.count {
                            self.refreshStartAnimation()
                        }
                })
        }
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = "1231231"
        return cell!
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if customRefresh.isRefreshing {
            refreshStartAnimation()
        }
    }
}

