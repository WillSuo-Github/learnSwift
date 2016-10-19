//
//  ViewController.swift
//  VedioBackground
//
//  Created by ws on 2016/10/11.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

class ViewController: VideoSplashViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
        
        contentUrl = url as NSURL
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

