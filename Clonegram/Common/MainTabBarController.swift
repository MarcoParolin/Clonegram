//
//  MainTabBarController.swift
//  Clonegram
//
//  Created by Marco Parolin on 09/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation
import UIKit
import Rswift

class MainTabBarController: UITabBarController {
    let mainCoordinator = FeedCoordinator(navigationController: BaseNavigationController())
    let exploreCoordinator = ExploreCoordinator(navigationController: BaseNavigationController())
    let cameraCoordinator = CameraCoordinator(navigationController: BaseNavigationController())
    let notificationsCoordinator = NotificationsCoordinator(navigationController: BaseNavigationController())
    let profileCoordinator = ProfileCoordinator(navigationController: BaseNavigationController())
    
    fileprivate var animator: UIViewPropertyAnimator?
    
    var displayedCoordinators: [BaseCoordinator] {
        return [mainCoordinator, exploreCoordinator, cameraCoordinator, notificationsCoordinator, profileCoordinator]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = R.color.tabBarBackground()
//        self.tabBar.isTranslucent = true
//        self.tabBar.backgroundColor = .clear
//        self.tabBar.shadowImage = UIImage()
//        self.tabBar.backgroundImage = UIImage()
        delegate = self
        
        self.animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: nil)
        
        self.tabBar.tintColor = UIColor.lightGray
        self.tabBar.unselectedItemTintColor = UIColor.lightGray
    }
    
    public func startup() {
        viewControllers = displayedCoordinators.getNavigationControllers()
        displayedCoordinators.startAll()
        displayedCoordinators.makePrimary(mainCoordinator, on: self)
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if let vc = viewController as? BaseViewController {
            guard !vc.shouldBeDisplayedAsModal else {
                vc.modalPresentationStyle = .overCurrentContext
                vc.modalTransitionStyle = .coverVertical
                present(vc, animated: true, completion: nil)
                
                return false
            }
        }
        
        let tabViewControllers = tabBarController.viewControllers
        guard let toIndex = tabViewControllers?.firstIndex(of: viewController) else {
            return false
        }
        
        animateToTab(toIndex)
        
        return true
    }
    
    func animateToTab(_ toIndex: Int) {
        
        guard let tabViewControllers = viewControllers,
            let selectedViewController = selectedViewController,
            let fromView = selectedViewController.view,
            let toView = tabViewControllers[toIndex].view,
            let fromIndex = tabViewControllers.firstIndex(of: selectedViewController) else {
                return
        }
        
        guard fromIndex != toIndex else {return}
        
        // Add the toView to the tab bar view
        fromView.superview?.addSubview(toView)
        
        // Position toView off screen (to the left/right of fromView)
        let screenWidth = UIScreen.main.bounds.size.width
        let scrollRight = toIndex > fromIndex
        let offset = (scrollRight ? screenWidth : -screenWidth)
        toView.center = CGPoint(x: fromView.center.x + offset, y: toView.center.y)
        
        // Disable interaction during animation
        view.isUserInteractionEnabled = false
//        animator?.stopAnimation(false)
//        animator?.pauseAnimation()
//
//        animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
//            fromView.center = CGPoint(x: fromView.center.x - offset, y: fromView.center.y)
//            toView.center   = CGPoint(x: toView.center.x - offset, y: toView.center.y)
//        })
//        animator?.addCompletion({ _ in
//            fromView.removeFromSuperview()
//            self.selectedIndex = toIndex
//            self.view.isUserInteractionEnabled = true
//        })
        
        if animator?.isRunning ?? false {
            animator?.stopAnimation(true)
        }
        
        animator = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut, animations: {
            fromView.center = CGPoint(x: fromView.center.x - offset, y: fromView.center.y)
            toView.center   = CGPoint(x: toView.center.x - offset, y: toView.center.y)
        })
        animator?.addCompletion({ _ in
            fromView.removeFromSuperview()
            self.selectedIndex = toIndex
            self.view.isUserInteractionEnabled = true
        })
        
        animator?.startAnimation()
        
//        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: [UIView.AnimationOptions.curveEaseOut, .beginFromCurrentState] , animations: {
//
//            // Slide the views by -offset
//            fromView.center = CGPoint(x: fromView.center.x - offset, y: fromView.center.y);
//            toView.center   = CGPoint(x: toView.center.x - offset, y: toView.center.y);
//
//        }, completion: { finished in
//
//            // Remove the old view from the tabbar view.
//            fromView.removeFromSuperview()
//            self.selectedIndex = toIndex
//            self.view.isUserInteractionEnabled = true
//        })
    }
}

extension Array where Element: BaseCoordinator {
    func getNavigationControllers() -> [UINavigationController] {
        return self.map { $0.navigationController }
    }
    
    func startAll() {
        self.forEach { $0.start() }
    }
    
    func makePrimary(_ coord: BaseCoordinator, on tabBarController: UITabBarController) {
        let index = self.firstIndex(where: { $0 == coord }) ?? 0
        tabBarController.selectedIndex = index
    }
}
