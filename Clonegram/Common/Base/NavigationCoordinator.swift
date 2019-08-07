//
//  NavigationCoordinator.swift
//  Clonegram
//
//  Created by Marco Parolin on 09/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation
import UIKit

class NavigationCoordinator: NSObject, Coordinator {
    
    public var navigationController: UINavigationController
    
    public override init() {
        self.navigationController = BaseNavigationController()
        super.init()
    }
    
    public var rootViewController: UIViewController {
        return navigationController
    }
}
