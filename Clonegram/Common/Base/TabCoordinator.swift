//
//  TabCoordinator.swift
//  Clonegram
//
//  Created by Marco Parolin on 09/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation
import UIKit

final class TabCoordinator: NSObject, Coordinator {
    var rootViewController = UIViewController()
    
//    var rootViewController: UIViewController {
//        return tabController
//    }
//
//    let tabController: UITabBarController
//
//    let homeCoordinator: TestCoordinator
//    let historyCoordinator: TestCoordinator
//    let profileCoordinator: TestCoordinator
//
//    var coordinators: [Coordinator] {
//        return [homeCoordinator, historyCoordinator, profileCoordinator]
//    }
//
//    init(navigationController: UINavigationController) {
//
//        tabController = UITabBarController()
//
//        homeCoordinator = HomeCoordinator(client: client, persistence: persistence)
//
//        historyCoordinator = HistoryCoordinator(client: client, persistence: persistence)
//
//        profileCoordinator = ProfileCoordinator(client: client, persistence: persistence)
//
//        var controllers: [UIViewController] = []
//
//        let homeViewController = homeCoordinator.rootViewController
//        homeViewController.tabBarItem = UITabBarItem(title: Localization.homeTab.string, image: Asset.iconMenuRecharge.image, selectedImage: Asset.iconMenuRechargeActivated.image)
//
//        let historyViewController = historyCoordinator.rootViewController
//        historyViewController.tabBarItem = UITabBarItem(title: Localization.walletTab.string, image: Asset.iconMenuWallet.image, selectedImage: Asset.iconMenuWalletActivated.image)
//
//        let profileViewController = profileCoordinator.rootViewController
//        profileViewController.tabBarItem = UITabBarItem(title: Localization.profileTab.string, image: Asset.iconMenuProfile.image, selectedImage: Asset.iconMenuProfileActivated.image)
//
//        super.init()
//
//        controllers.append(homeViewController)
//        controllers.append(historyViewController)
//        controllers.append(profileViewController)
//
//        tabController.viewControllers = controllers
//        tabController.tabBar.isTranslucent = false
//        tabController.delegate = self
//
//    }
}
