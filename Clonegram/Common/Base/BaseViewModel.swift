//
//  BaseViewModel.swift
//  Clonegram
//
//  Created by Marco Parolin on 09/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation
import UIKit

protocol BaseViewProtocol: AnyObject {
    func dataLoaded()
    func goBack()
}

class BaseViewModel<Coordinator: BaseCoordinator>: NSObject {
    
    weak var view: BaseViewProtocol?
    
    var coordinator: Coordinator
    
    init(withCoordinator coordinator: Coordinator) {
        self.coordinator = coordinator
        super.init()
        self.setup()
    }
    
//    override init() {
//        fatalError()
//        super.init()
//        self.setup()
//    }
    
    func setup() {
        
    }
    
    func showHud() {
        self.coordinator.showHud()
    }
    
    func hideHud() {
        self.coordinator.hideHud()
    }
    
    func openMenu() {
        self.coordinator.openMenu()
    }
    
    func goBack(animated: Bool = true) {
        self.coordinator.goBack(animated: animated)
    }
    
    func backToHome() {
        self.coordinator.backToHome()
    }
}
