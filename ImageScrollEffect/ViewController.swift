//
//  ViewController.swift
//  ImageScrollEffect
//
//  Created by ws on 2016/10/10.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var bgImageView = UIImageView()
    var myScrollView = UIScrollView()
    var myImageView = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setUpSubViews()
    }
    
    private func setUpSubViews() {
        
        bgImageView = UIImageView(image: UIImage(named: "steve"))
        bgImageView.frame = view.bounds
        view.addSubview(bgImageView)
        
        myImageView = UIImageView(image: UIImage(named: "steve"))
        myScrollView = UIScrollView(frame: view.bounds)
        myScrollView.contentSize = myImageView.bounds.size
        
        view.addSubview(myScrollView)
        myScrollView.addSubview(myImageView)
        myImageView.center = myScrollView.center
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

