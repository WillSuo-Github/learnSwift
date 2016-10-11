//
//  ViewController.swift
//  LoginAnimation
//
//  Created by ws on 2016/10/11.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func btnAction(sender: AnyObject) {
        
        let loginVc = LoginViewController()
        loginVc.isShowAnimation = true
        loginVc.modalTransitionStyle = .CoverVertical
        loginVc.modalPresentationStyle = .FullScreen
//        self.modalTransitionStyle = .CrossDissolve
//        self.modalPresentationStyle = .FullScreen
        presentViewController(loginVc, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

