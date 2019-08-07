//
//  AppDelegate.swift
//  Clonegram
//
//  Created by Marco Parolin on 09/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = {
        return UIWindow(frame: UIScreen.main.bounds)
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.startup()
        
        return true
    }
    
    func startup() {
        
        //        let navigationController = UINavigationController()
        //        self.window?.rootViewController = navigationController
        self.window?.rootViewController = MainTabBarController()
        self.window?.makeKeyAndVisible()
        
        Mock.generateUsers(completion: {
            Mock.generateText()
            Mock.generatePosts()
            (self.window?.rootViewController as? MainTabBarController)?.startup()
        })
        
//        let startupCoordinator = ApplicationCoordinator(navigationController: navigationController)
//        ApplicationDataProvider.shared.applicationCoordinator = startupCoordinator
//        startupCoordinator.start()
//        navigationController.interactivePopGestureRecognizer?.delegate = nil
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }

}
