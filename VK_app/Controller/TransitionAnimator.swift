//
//  TransitionAnimator.swift
//  VK_app
//
//  Created by Alex x on 4/20/22.
//

import UIKit

enum Present {
    case modal
    case navigationController
}

class TransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    let isPresent: Bool
    let present: Present
    let time:TimeInterval = 3.0
    
    init(isPresent: Bool, present: Present) {
        self.isPresent = isPresent
        self.present = present
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return time
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPresent {
            forPresent(using: transitionContext)
        } else {
            forDismiss(using: transitionContext)
        }
    }
    
    func forPresent(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to) else{
                  return
              }
        
        let containerView = transitionContext.containerView
        
        containerView.addSubview(destination.view)
        
        destination.view.transform = CGAffineTransform(rotationAngle: -(.pi / 2))
        destination.view.frame = CGRect(x: containerView.frame.width,
                                        y: 0,
                                        width: source.view.frame.height,
                                        height: source.view.frame.width)
        
        
        UIView.animate(withDuration: time) {
            destination.view.center = source.view.center
            destination.view.transform = .identity
        } completion: { isComplete in
            transitionContext.completeTransition(isComplete)
        }

        
    }
    
    func forDismiss(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let source = transitionContext.viewController(forKey: .from),
              let destination = transitionContext.viewController(forKey: .to) else{
                  return
              }
        
        let containerView = transitionContext.containerView
        
        containerView.addSubview(destination.view)
        
        if present == Present.navigationController {
            containerView.insertSubview(destination.view, belowSubview: source.view)
            destination.view.frame = transitionContext.finalFrame(for: destination)
        }
        
//        destination.view.transform = CGAffineTransform(rotationAngle: .pi / 2)
//        destination.view.frame = CGRect(x: 0,
//                                        y: 0,
//                                        width: source.view.frame.height,
//                                        height: source.view.frame.width)
        
        
        UIView.animate(withDuration: time) {
            source.view.transform = CGAffineTransform(rotationAngle: -(.pi / 2))
            source.view.frame.origin = CGPoint(x: containerView.frame.width,
                                               y: 0)
            
        } completion: { isComplete in
            transitionContext.completeTransition(isComplete)
        }

        
    }
    
        
    
    
}
