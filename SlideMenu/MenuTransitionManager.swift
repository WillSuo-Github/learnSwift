//
//  MenuTransitionManager.swift
//  learnSwift
//
//  Created by ws on 2016/10/12.
//  Copyright © 2016年 ws. All rights reserved.
//

import UIKit

class MenuTransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    
    
    var snapshot:UIView?
    internal var isPush = false
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 3
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        let container = transitionContext.containerView()
        let moveDown = CGAffineTransformMakeTranslation(0, container!.frame.height - 150)
        let moveUp = CGAffineTransformMakeTranslation(0, -50)
        
        if isPush {
            toView.transform = moveUp
            snapshot = fromView.snapshotViewAfterScreenUpdates(true)
            container?.addSubview(toView)
            container?.addSubview(snapshot!)
        }else{
            
        }

        
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.3, options: .CurveEaseInOut, animations: {
            if self.isPush {
                self.snapshot?.transform = moveDown
                toView.transform = CGAffineTransformIdentity
            }else{
                self.snapshot?.transform = CGAffineTransformMakeTranslation(0, 0)
                fromView.transform = moveUp
            }
        
            }, completion: { finished in
                
                
                transitionContext.completeTransition(true)
                if !self.isPush {
                    self.snapshot?.removeFromSuperview()
                    container?.addSubview(toView)
                }
        })

    }
    


}
