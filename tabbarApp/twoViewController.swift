
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
    
    override func viewDidAppear(_ animated: Bool) {
        imageView?.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 1.0) {
            self.imageView?.transform = CGAffineTransform.identity
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
