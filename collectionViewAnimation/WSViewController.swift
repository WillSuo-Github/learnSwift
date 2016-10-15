//
//  WSViewController.swift
//  learnSwift
//
//  Created by ws on 2016/10/13.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

class WSViewController: UIViewController, UINavigationControllerDelegate {

    var viewModel: AnimationCellModel!
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteColor()
        imageView = UIImageView(image: UIImage(named: viewModel.imagePath))
        imageView.frame = CGRect(x: 0, y: 64, width: view.bounds.size.width, height: 300)
        imageView.contentMode = .ScaleToFill
        view.addSubview(imageView)
        
        
        let textView = UITextView(frame: CGRect(x: 0, y: 364, width: view.bounds.size.width, height: view.bounds.size.height - 300))
        view.addSubview(textView)
        textView.text = "123123123askjdfl;akjdsl;fjkal;djsfl;ajkdl;fjal;kdjfl;ajdlfjal;kd"
//        self.navigationController?.delegate = self
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "huiqu", style: .Plain, target: self, action: #selector(WSViewController.popActivity))
    }
    
    func popActivity() {
        navigationController?.popViewControllerAnimated(true)
    }

    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
//        print(operation)
//        if operation == .Push{
//            return CustomAnimation(type: .push)
//        }else{
////            return CustomAnimation(type: .pop)
//            return nil
//        }
        return CustomAnimation(type: operation == .Push ? .push : .pop)
    }
   
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print(self.imageView)
    }
    
}


