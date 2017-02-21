//
//  PresentAnimation.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/2/11.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import UIKit

class PresentAnimation: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.27
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: .from)
        let toViewController = transitionContext.viewController(forKey: .to)
        let containerView = transitionContext.containerView
        
        let toVCFinalFrame = transitionContext.finalFrame(for: toViewController!)
        let fromVCFinalFrame = transitionContext.initialFrame(for: fromViewController!).offsetBy(dx: -ym_ScreenWidth * 0.3, dy: 0)
        toViewController?.view.frame = toVCFinalFrame.offsetBy(dx: ym_ScreenWidth, dy: 0)
        
        containerView.insertSubview((toViewController?.view)!, belowSubview: (toViewController?.view)!)
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, animations: {
            toViewController?.view.frame = toVCFinalFrame
            fromViewController?.view.frame = fromVCFinalFrame
        }) { (finished) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
