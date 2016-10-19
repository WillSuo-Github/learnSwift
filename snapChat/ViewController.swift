//
//  ViewController.swift
//  snapChat
//
//  Created by ws on 2016/10/7.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(scrollView)
        
        let leftVc = LeftViewController()
        let centerVc = CenterViewController()
        let rightVc = RightViewController()
        
        self.addChildViewController(leftVc)
        scrollView.addSubview(leftVc.view)
        leftVc.didMove(toParentViewController: self)
        
        self.addChildViewController(centerVc)
        scrollView.addSubview(centerVc.view)
        centerVc.didMove(toParentViewController: self)
        
        self.addChildViewController(rightVc)
        scrollView.addSubview(rightVc.view)
        rightVc.didMove(toParentViewController: self)
        
        var centerViewFrame = centerVc.view.frame
        centerViewFrame.origin.x = self.view.bounds.size.width
        centerVc.view.frame = centerViewFrame
        
        var rightViewFrame = rightVc.view.frame
        rightViewFrame.origin.x = self.view.bounds.size.width * 2
        rightVc.view.frame = rightViewFrame
        
        scrollView.contentSize = CGSize(width: self.view.bounds.width * 3, height: self.view.bounds.height)
        
        weak var weakRight = rightVc
        
        leftVc.touchBlock = {
            print("block回调")
            //两个方法必须同时调用
            if weakRight == nil {return}
            weakRight!.view.removeFromSuperview()//删除视图
            weakRight!.removeFromParentViewController()//删除引用才会调用deinit
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    lazy var scrollView: UIScrollView = {
        let t: UIScrollView = UIScrollView(frame: self.view.bounds)
        t.backgroundColor = UIColor.purple
        t.isPagingEnabled = true
        return t
    }()

}

