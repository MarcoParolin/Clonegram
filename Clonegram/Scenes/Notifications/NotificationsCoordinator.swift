//
//  NotificationsCoordinator.swift
//  Clonegram
//
//  Created by Marco Parolin on 09/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation
import UIKit

class NotificationsCoordinator: BaseCoordinator {
    
    override func start() {
        super.start()
        let viewController = prepareMainViewController()
        viewController.tabBarItem = UITabBarItem(title: "", image: R.image.tabBarNotificationsIcon(), selectedImage: R.image.tabBarNotificationsIconSelected())
//        navigationController.pushViewController(viewController, animated: true)
        self.pushFirst(viewController: viewController, animated: true)
    }
    
    private func prepareMainViewController() -> UIViewController {
        let viewModel = NotificationsViewModel(withCoordinator: self)
        let viewController = NotificationsViewController(withViewModel: viewModel)
        return viewController
    }
    
//    func showTestController() {
//        self.startCoordinator(TestCoordinator(navigationController: self.navigationController))
//        //        let viewModel = TestViewModel(withCoordinator: self)
//        //        let viewController = TestViewController(withViewModel: viewModel)
//        //        self.navigationController.pushViewController(viewController, animated: true)
//    }
}
