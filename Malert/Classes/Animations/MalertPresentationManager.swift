//
//  MalertAnimation.swift
//  Pods
//
//  Created by Vitor Mesquita on 04/11/16.
//
//

import UIKit

public enum MalertAnimationType {
    case modalBottom
    case modalLeft
    case modalRight
    case fadeIn
}

class MalertPresentationManager: NSObject, UIViewControllerTransitioningDelegate {
    
    var animationType: MalertAnimationType = .modalBottom
    var interactor: MalertInteractiveTransition?
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MalertPresentTransitioning(animationType: self.animationType)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return MalertDimissTransitioning(animationType: self.animationType)
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if let interactor = interactor {
            return interactor.hasStarted ? interactor : nil
        }
        return nil
    }
}
