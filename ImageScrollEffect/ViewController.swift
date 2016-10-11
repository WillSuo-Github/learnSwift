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
    var btn = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setUpSubViews()
        
        setZoomScaleFor(myScrollView.bounds.size)
        myScrollView.zoomScale = myScrollView.minimumZoomScale
        
        recenterImage()
        myScrollView.delegate = self
    }
    
    private func setUpSubViews() {
        
        bgImageView = UIImageView(image: UIImage(named: "steve"))
        bgImageView.frame = view.bounds
        view.addSubview(bgImageView)
        
        let effect = UIBlurEffect(style: .Dark)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = bgImageView.bounds
        bgImageView.addSubview(effectView)
        
        myImageView = UIImageView(image: UIImage(named: "steve"))
        myScrollView = UIScrollView(frame: view.bounds)
        myScrollView.backgroundColor = .clearColor()
        myScrollView.contentSize = myImageView.bounds.size
        
        view.addSubview(myScrollView)
        myScrollView.addSubview(myImageView)
        myScrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        
        btn = UIButton(frame: CGRect(x: 100, y: 100, width: 40, height: 40))
        btn.backgroundColor = .redColor()
        myScrollView.addSubview(btn)
        
        
//        var imageFrame = myImageView.frame;
//        imageFrame.size.width = bgImageView.frame.size.width
//        myImageView.frame = imageFrame
//        myImageView.center = myScrollView.center
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setZoomScaleFor(myScrollView.bounds.size)
        
        if myScrollView.zoomScale < myScrollView.minimumZoomScale {
            myScrollView.zoomScale = myScrollView.minimumZoomScale
        }
    }
    
    private func setZoomScaleFor(srollViewSize: CGSize) {
        
        let imageSize = myImageView.bounds.size
        let widthScale = srollViewSize.width / imageSize.width
        let heightScale = srollViewSize.height / imageSize.height
        let minimunScale = min(widthScale, heightScale)
        
        myScrollView.minimumZoomScale = minimunScale
        myScrollView.maximumZoomScale = 3.0
        
    }
    
    private func recenterImage() {
        
        let scrollViewSize = myScrollView.bounds.size
        let imageViewSize = myImageView.frame.size
        let horizontalSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2.0 : 0
        let verticalSpace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.width) / 2.0 :0
        
        myScrollView.contentInset = UIEdgeInsetsMake(verticalSpace, horizontalSpace, verticalSpace, horizontalSpace)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension ViewController: UIScrollViewDelegate{
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return myImageView
    }
    
    func scrollViewWillBeginZooming(scrollView: UIScrollView, withView view: UIView?) {
        print(view)
    }
    
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        recenterImage()
    }
}

