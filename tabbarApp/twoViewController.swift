
//
//  twoViewController.swift
//  learnSwift
//
//  Created by ws on 2016/10/16.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

class twoViewController: UIViewController {

    var imageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView(image: UIImage(named: "Explore"))
        imageView?.frame = view.bounds
        view.addSubview(imageView!)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        imageView?.transform = CGAffineTransformMakeScale(0.5, 0.5)
        UIView.animateWithDuration(1) { 
            self.imageView?.transform = CGAffineTransformIdentity
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
