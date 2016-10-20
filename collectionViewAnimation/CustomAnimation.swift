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
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let t = type as NavTransitionType
        switch t {
        case .push:
            doPushAnimation(context: transitionContext)
        case .pop:
            doPopAnimation(context: transitionContext)
            
        }
    }
    
    private func doPushAnimation(context: UIViewControllerContextTransitioning) {
        let fromVc: ViewController = context.viewController(forKey: UITransitionContextViewControllerKey.from) as! ViewController
        let toVc = context.viewController(forKey: UITransitionContextViewControllerKey.to) as! WSViewController
        let cell = fromVc.myCollectionView?.cellForItem(at: fromVc.currentIndex!) as! AnimationCollectionViewCell
        let tmpImageView = cell.animationImageView.snapshotView(afterScreenUpdates: false)
        let containerView = context.containerView
        tmpImageView?.frame = cell.animationImageView.convert(cell.animationImageView.bounds, to: containerView)
        print(cell.animationImageView.convert(cell.animationImageView.bounds, to: containerView))
        cell.animationImageView.isHidden = true
        toVc.view.alpha = 0
        toVc.imageView.isHidden = true
        containerView.addSubview(toVc.view)
        containerView.addSubview(tmpImageView!)
        
        
        UIView.animate(withDuration: transitionDuration(using: context), animations: { 
            print( toVc.imageView.convert(toVc.imageView.bounds, to: containerView))
            tmpImageView?.frame = toVc.imageView.convert(toVc.imageView.bounds, to: containerView)
            toVc.view.alpha = 1
            
            
            }) { (finished) in
               toVc.imageView.isHidden = false
                tmpImageView?.removeFromSuperview()
                context.completeTransition(true)
        }
    }
    
    private func doPopAnimation(context: UIViewControllerContextTransitioning) {
        
        let toVc: ViewController = context.viewController(forKey: UITransitionContextViewControllerKey.to) as! ViewController
        let fromVc = context.viewController(forKey: UITransitionContextViewControllerKey.from) as! WSViewController
        let cell = toVc.myCollectionView?.cellForItem(at: toVc.currentIndex!) as! AnimationCollectionViewCell
        let tmpImageView = fromVc.imageView.snapshotView(afterScreenUpdates: false)
        let containerView = context.containerView
        tmpImageView?.frame = fromVc.imageView.frame
        cell.animationImageView.isHidden = true
        toVc.view.alpha = 0
        cell.animationImageView.isHidden = true
        containerView.addSubview(toVc.view)
        containerView.addSubview(tmpImageView!)
        
        UIView.animate(withDuration: transitionDuration(using: context), animations: { 
            
            tmpImageView?.frame = cell.animationImageView.convert(cell.animationImageView.bounds, to: containerView)
            toVc.view.alpha = 1
            })
        { (finished) in
            tmpImageView?.removeFromSuperview()
            cell.animationImageView.isHidden = false
            context.completeTransition(true)
        }
    }

}


