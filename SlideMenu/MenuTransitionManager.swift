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
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        
        let container = transitionContext.containerView
        let moveDown = CGAffineTransform.init(translationX: 0, y: container.frame.height - 150)
        let moveUp = CGAffineTransform.init(translationX: 0, y: -50)
        
        if isPush {
            toView.transform = moveUp
            snapshot = fromView.snapshotView(afterScreenUpdates: true)
            container.addSubview(toView)
            container.addSubview(snapshot!)
        }else{
            
        }

        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
            if self.isPush {
                self.snapshot?.transform = moveDown
                toView.transform = CGAffineTransform.identity
            }else{
                self.snapshot?.transform = CGAffineTransform(translationX: 0, y: 0)
                fromView.transform = moveUp
            }
        
            }, completion: { finished in
                
                
                transitionContext.completeTransition(true)
                if !self.isPush {
                    self.snapshot?.removeFromSuperview()
                    container.addSubview(toView)
                }
        })

    }
    


}
