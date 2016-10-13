//
//  WSViewController.swift
//  learnSwift
//
//  Created by ws on 2016/10/13.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

class WSViewController: UIViewController {

    
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .whiteColor()
        imageView = UIImageView(image: UIImage(named: "1"))
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 300)
        let textView = UITextView(frame: CGRect(x: 0, y: 300, width: view.bounds.size.width, height: view.bounds.size.height - 300))
        view.addSubview(textView)
        textView.text = "123123123askjdfl;akjdsl;fjkal;djsfl;ajkdl;fjal;kdjfl;ajdlfjal;kd"
        navigationController?.delegate = self
    }

}

extension WSViewController: UINavigationControllerDelegate {
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return operation == .Push ? CustomAnimation(type: .push) : nil
    }
}
