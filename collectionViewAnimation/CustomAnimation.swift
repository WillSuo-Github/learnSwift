//
//  CustomAnimation.swift
//  learnSwift
//
//  Created by ws on 2016/10/13.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

enum NavTransitionType {
    case push
    case pop
}

enum CompassPoint {
    case North
    case South
    case East
    case West
}

class CustomAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    var type: NavTransitionType!
    
    init(type: NavTransitionType) {
        super.init()
        self.type = type
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        
        return 0.75
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let t = type as NavTransitionType
        switch t {
        case .push:
            doPushAnimation(transitionContext)
        case .pop:
            doPopAnimation(transitionContext)
            
        }
    }
    
    private func doPushAnimation(context: UIViewControllerContextTransitioning) {
        let fromVc: ViewController = context.viewControllerForKey(UITransitionContextFromViewControllerKey) as! ViewController
        let toVc = context.viewControllerForKey(UITransitionContextToViewControllerKey) as! WSViewController
        let cell = fromVc.myCollectionView?.cellForItemAtIndexPath(fromVc.currentIndex!) as! AnimationCollectionViewCell
        let tmpImageView = cell.animationImageView.snapshotViewAfterScreenUpdates(true)
        let containerView = context.containerView()
        tmpImageView.frame = cell.animationImageView.convertRect(cell.animationImageView.bounds, toView: toVc.view)
        cell.animationImageView.hidden = true
        toVc.view.alpha = 0
        toVc.imageView.hidden = true
        containerView?.addSubview(toVc.view)
        containerView?.addSubview(tmpImageView)
        
        UIView.animateWithDuration(transitionDuration(context)) {
            
            tmpImageView.frame = tmpImageView.convertRect(toVc.imageView.bounds, toView: toVc.view)
            toVc.view.alpha = 1
        }
        
    }
    
    private func doPopAnimation(context: UIViewControllerContextTransitioning) {
        
//        let fromVc: ViewController = context.viewControllerForKey(UITransitionContextFromViewControllerKey) as! ViewController
//        let toVc = context.viewControllerForKey(UITransitionContextToViewControllerKey) as! WSViewController
//        let cell = fromVc.myCollectionView?.cellForItemAtIndexPath(fromVc.currentIndex!) as! AnimationCollectionViewCell
//        let tmpImageView = cell.animationImageView.snapshotViewAfterScreenUpdates(true)
//        let containerView = context.containerView()
//        tmpImageView.frame = cell.animationImageView.convertRect(cell.animationImageView.bounds, toView: toVc.view)
//        cell.animationImageView.hidden = true
//        toVc.view.alpha = 0
//        toVc.imageView.hidden = true
//        containerView?.addSubview(toVc.view)
//        containerView?.addSubview(tmpImageView)
//        
//        UIView.animateWithDuration(transitionDuration(context)) {
//            
//            tmpImageView.frame = tmpImageView.convertRect(toVc.imageView.bounds, toView: toVc.view)
//            toVc.view.alpha = 1
//        }
    }

}


