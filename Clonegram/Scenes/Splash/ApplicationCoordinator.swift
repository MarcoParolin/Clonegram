//
//  ApplicationCoordinator.swift
//  Clonegram
//
//  Created by Marco Parolin on 09/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation
import UIKit

class ApplicationCoordinator: BaseCoordinator {
    
    override func start() {
        super.start()
        
        let viewModel = SplashViewModel(withCoordinator: self)
        let viewController = SplashViewController(withViewModel: viewModel)
        viewController.tabBarItem = UITabBarItem(title: "Main", image: nil, selectedImage: nil)
        self.navigationController.isNavigationBarHidden = true
        self.navigationController.viewControllers = [viewController]
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1) {
            self.navigationController.isNavigationBarHidden = false
            self.startUpApplication()
        }
    }
    
    func startUpApplication() {
        let coordinator = FeedCoordinator(navigationController: self.navigationController)
        coordinator.start()
        
        self.navigationController.isNavigationBarHidden = false
    }
    
    //TODO: Implement Login
    func login() {
//        let coordinator = LoginCoordinator(navigationController: self.navigationController)
//        coordinator.start()
    }
    
    //TODO: Implement Logout
    func logout() {
//        login()
    }
    
}
