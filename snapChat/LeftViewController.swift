//
//  LeftViewController.swift
//  learnSwift
//
//  Created by ws on 2016/10/7.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {
    
    var touchBlock: ()-> () = {}

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(1111)
        touchBlock()
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
