//
//  BaseCoordinator.swift
//  Clonegram
//
//  Created by Marco Parolin on 09/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation
import UIKit

protocol BaseCoordinatorProtocol {
    func openMenu()
    func goBack(animated: Bool)
    
    func showHud()
    func hideHud()
    
    func start()
    func backToHome()
}

class BaseCoordinator: NSObject, BaseCoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    var firstController: UIViewController? {
        return navigationController.viewControllers.first
    }
    var displayedController: UIViewController? {
        return navigationController.visibleViewController
    }
    
    required init(navigationController navController: UINavigationController) {
        self.navigationController = navController
        super.init()
    }
    
    func startCoordinator(_ coord: BaseCoordinator) {
        coord.start()
    }
    
    func start() {
        
    }
    
    func openMenu() {
//        let coordinator = MenuCoordinator(navigationController: self.navigationController)
//        coordinator.start()
    }
    
    func backToHome() {
//        let coordinator = HomePageCoordinator(navigationController: self.navigationController)
//        coordinator.goToHome(animated: false)
    }
    
    func backToHome(withQuotationId: String? = nil) {
//        let coordinator = HomePageCoordinator(navigationController: self.navigationController)
//        if let q = withQuotationId {
//            coordinator.goToHomeFromQuotation(id: q, animated: false)
//            return
//        }
//        coordinator.goToHome(animated: false)
    }
    
//    func presentModally(_ viewController: UIViewController, animated: Bool = true, completion:(() -> Void)? = nil, presentationStyle: UIModalPresentationStyle = .overCurrentContext) {
//        viewController.modalPresentationStyle = presentationStyle
//        if self.navigationController.presentedViewController != nil {
//            self.navigationController.dismiss(animated: animated, completion: {
//                self.navigationController.present(viewController, animated: animated, completion: completion)
//            })
//        } else {
//            self.navigationController.present(viewController, animated: animated, completion: completion)
//        }
//    }
    
    func dismissModalViewController(completion: @escaping () -> Void = {}) {
//        if self.navigationController.presentedViewController != nil {
//            self.navigationController.dismiss(animated: true, completion: completion)
//        } else {
//            completion()
//        }
    }
    
    func goBack(animated: Bool = true) {
        if self.navigationController.presentedViewController != nil {
            if let vc = self.navigationController.topViewController as? BaseViewController {
                vc.willDismissPresentedViewController()
            }
            self.navigationController.dismiss(animated: animated, completion: nil)
        } else {
            self.navigationController.popViewController(animated: animated)
        }
    }
    
    func pushFirst(viewController: UIViewController, animated: Bool = true) {
        self.navigationController.setViewControllers([viewController], animated: animated)
    }
    
    func popToFirst(viewController: UIViewController, animated: Bool = true) {
//        if animated {
//            var viewControllers = self.navigationController.viewControllers
//            if let index = viewControllers.index(of: viewController) {
//                viewControllers.remove(at: index)
//            }
//            viewControllers.insert(viewController, at: 0)
//            self.navigationController.setViewControllers(viewControllers, animated: false)
//            self.navigationController.popToRootViewController(animated: true)
//        } else {
//            self.pushFirst(viewController: viewController, animated: false)
//        }
    }
    
    func showHud() {
//        OverlayManager.showHud()
    }
    
    func hideHud() {
//        OverlayManager.hideHud()
    }

    private func selfOrCreateCoordinator<CoordType: BaseCoordinator>() -> CoordType {
//        if let c = self as? CoordType {
//            return c
//        } else {
            return CoordType(navigationController: navigationController)
//        }
    }
    
}
