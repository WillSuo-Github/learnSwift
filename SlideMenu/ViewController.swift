//
//  ViewController.swift
//  SlideMenu
//
//  Created by ws on 2016/10/12.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let _: UIButton = {
           
            let btn: UIButton = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
            btn.backgroundColor = .redColor()
            view.addSubview(btn)
            
            btn.addTarget(self, action: #selector(ViewController.btnDidChick), forControlEvents: .TouchUpInside)
            return btn
        }()
        
    }
    
    func btnDidChick() {
        
        let tableVc = TableViewController()
        let nav = UINavigationController(rootViewController: tableVc)
        presentViewController(nav, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}




