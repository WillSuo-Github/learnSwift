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
        
        return 0.5
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
        let tmpImageView = cell.animationImageView.snapshotViewAfterScreenUpdates(false)
        let containerView = context.containerView()
        tmpImageView.frame = cell.animationImageView.convertRect(cell.animationImageView.bounds, toView: containerView)
        print(cell.animationImageView.convertRect(cell.animationImageView.bounds, toView: containerView))
        cell.animationImageView.hidden = true
        toVc.view.alpha = 0
        toVc.imageView.hidden = true
        containerView?.addSubview(toVc.view)
        containerView?.addSubview(tmpImageView)
        
        
        UIView.animateWithDuration(transitionDuration(context), animations: { 
            print( toVc.imageView.convertRect(toVc.imageView.bounds, toView: containerView))
            tmpImageView.frame = toVc.imageView.convertRect(toVc.imageView.bounds, toView: containerView)
            toVc.view.alpha = 1
            
            
            }) { (finished) in
               toVc.imageView.hidden = false
                tmpImageView.removeFromSuperview()
                context.completeTransition(true)
        }
    }
    
    private func doPopAnimation(context: UIViewControllerContextTransitioning) {
        
        let toVc: ViewController = context.viewControllerForKey(UITransitionContextToViewControllerKey) as! ViewController
        let fromVc = context.viewControllerForKey(UITransitionContextFromViewControllerKey) as! WSViewController
        let cell = toVc.myCollectionView?.cellForItemAtIndexPath(toVc.currentIndex!) as! AnimationCollectionViewCell
        let tmpImageView = fromVc.imageView.snapshotViewAfterScreenUpdates(false)
        let containerView = context.containerView()
        tmpImageView.frame = fromVc.imageView.frame
        cell.animationImageView.hidden = true
        toVc.view.alpha = 0
        cell.animationImageView.hidden = true
        containerView?.addSubview(toVc.view)
        containerView?.addSubview(tmpImageView)
        
        UIView.animateWithDuration(transitionDuration(context), animations: { 
            
            tmpImageView.frame = cell.animationImageView.convertRect(cell.animationImageView.bounds, toView: containerView)
            toVc.view.alpha = 1
            })
        { (finished) in
            tmpImageView.removeFromSuperview()
            cell.animationImageView.hidden = false
            context.completeTransition(true)
        }
    }

}


