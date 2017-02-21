//
//  DismissAnimation.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/2/11.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import UIKit

class DismissAnimation: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: .from)
        let toViewController = transitionContext.viewController(forKey: .to)
        let containerView = transitionContext.containerView
        
        let screenBounds = UIScreen.main.bounds
        let fromVCInitailFrame = transitionContext.initialFrame(for: fromViewController!)
        let fromVCFinalFrame = fromVCInitailFrame.offsetBy(dx: screenBounds.size.width, dy: 0)
        
        containerView.insertSubview((toViewController?.view)!, belowSubview: (fromViewController?.view)!)
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, animations: {
            fromViewController?.view.frame = fromVCFinalFrame
            toViewController?.view.frame = fromVCInitailFrame
        }) { (finished) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }

}
