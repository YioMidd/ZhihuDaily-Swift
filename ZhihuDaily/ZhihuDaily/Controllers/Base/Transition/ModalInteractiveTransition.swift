//
//  ModalInteractiveTransition.swift
//  ZhihuDaily
//
//  Created by KiBen on 17/2/11.
//  Copyright © 2017年 YioMidd. All rights reserved.
//

import UIKit

class ModalInteractiveTransition: NSObject, UIViewControllerTransitioningDelegate {

    weak private var presentingController: UIViewController!
    private var presentAnimation: PresentAnimation!
    private var dismissAnimation: DismissAnimation!
    private let percentTransition = UIPercentDrivenInteractiveTransition()
    
    required init(controller: UIViewController) {
        super.init()
        presentingController = controller
        presentAnimation = PresentAnimation()
        dismissAnimation = DismissAnimation()
        presentingController.transitioningDelegate = self
        let gestuer = UIPanGestureRecognizer(target: self, action: #selector(handlerControllerTransition(_:)))
        gestuer.maximumNumberOfTouches = 1
        presentingController.view.addGestureRecognizer(gestuer)
    }
    
    @objc private func handlerControllerTransition(_ recognizer: UIPanGestureRecognizer) {
        print("\(recognizer.translation(in: recognizer.view))")
        var percent = recognizer.translation(in: recognizer.view).x / (recognizer.view?.width)!
        percent = min(1.0, max(0.0, percent));
        if recognizer.state == .began {
            presentingController.dismiss(animated: true, completion: nil)
        }else if recognizer.state == .changed {
            percentTransition.update(percent)
        }else if recognizer.state == .ended || recognizer.state == .cancelled {
            if percent >= 0.25 {
                percentTransition.finish()
            }else {
                percentTransition.cancel()
            }
        }
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentAnimation
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissAnimation
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return percentTransition
    }

}
