//
//  LoginViewController.swift
//  learnSwift
//
//  Created by ws on 2016/10/11.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    internal var isShowAnimation: Bool = false

    @IBOutlet weak var AccountCenterX: NSLayoutConstraint!
    @IBOutlet weak var PwdCenterX: NSLayoutConstraint!
    @IBOutlet weak var LoginBtnCenterX: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        AccountCenterX.constant = -500
        PwdCenterX.constant = -500
        LoginBtnCenterX.constant = -500
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isShowAnimation {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                self.AccountCenterX.constant = 0
                self.view.layoutIfNeeded()
                }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseIn, animations: {
                self.PwdCenterX.constant = 0
                self.view.layoutIfNeeded()
                }, completion: nil)
            
            UIView.animate(withDuration: 0.5, delay: 0.4, options: .curveEaseIn, animations: {
                self.LoginBtnCenterX.constant = 0
                self.view.layoutIfNeeded()
                }, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
