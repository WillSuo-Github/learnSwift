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
            t.tintColor = .clearColor()
            t.backgroundColor = .clearColor()
            tableView.addSubview(t)
            return t
        }()
        
        configRefreshContentView()
    }
    
    private func configRefreshContentView() {
        let refreshContents = NSBundle.mainBundle().loadNibNamed("contentView", owner: self, options: nil)
        let contentView = refreshContents[0] as! UIView
        contentView.frame = customRefresh.bounds
        customRefresh.addSubview(contentView)
        for i in 0..<contentView.subviews.count {
            labelArr.append(contentView.viewWithTag(i + 1) as! UILabel)
        }
    }
    
    private func refreshStartAnimation() {
        
        
        UIView.animateWithDuration(0.5, animations: { 
            self.labelArr[self.index].transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4))
            self.labelArr[self.index].textColor = .redColor()
            }) { (finished) in
                
                UIView.animateWithDuration(0.5, animations: { 
                    self.labelArr[self.index].transform = CGAffineTransformIdentity
                    self.labelArr[self.index].textColor = .blackColor()
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell")
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = "1231231"
        return cell!
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if customRefresh.refreshing {
            refreshStartAnimation()
        }
        
    }
}

