//
//  NavigationControllerDelegate.swift
//  VK_app
//
//  Created by Alex x on 4/20/22.
//

import UIKit


class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .push:
            return TransitionAnimator(isPresent: true, present: .navigationController)
        case .pop:
            return TransitionAnimator(isPresent: false, present: .navigationController)
        default:
            return nil
        }
    }
    
}
