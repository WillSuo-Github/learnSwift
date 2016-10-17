//
//  ViewController.swift
//  customFont
//
//  Created by ws on 2016/10/7.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    


    @IBOutlet weak var tableView: UITableView!
    var dataArr = ["213123123", "我曹按时大佛爱就是都费劲啊都是发", "asdfoikqjwerk"]
    var fontNameArr = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "Gaspar Regular"]
    var fontIndex = 3
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func changeFontChick(_ sender: AnyObject) {
        fontIndex = Int(arc4random()) % fontNameArr.count
        print(fontIndex)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
//        if cell == nil {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
//        }
//        cell?.textLabel?.text = dataArr[indexPath.row]
//        cell?.textLabel?.font = UIFont(name: fontNameArr[fontIndex], size: 16)
//        print(UIFont(name: fontNameArr[fontIndex], size: 16))
//        
//        return cell!
//    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = dataArr[indexPath.row]
        cell?.textLabel?.font = UIFont(name: fontNameArr[fontIndex], size: 16)
        print(UIFont(name: fontNameArr[fontIndex], size: 16))
        
        return cell!
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

