//
//  BaseComponentViewModel.swift
//  Clonegram
//
//  Created by Marco Parolin on 14/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation

protocol BaseComponentProtocol: AnyObject {
    func dataLoaded()
}

class BaseComponentViewModel: NSObject {
    
    weak var view: BaseComponentProtocol?
    
    override init() {
        super.init()
        self.setup()
        self.view?.dataLoaded()
    }
   
    func setup() {
        
    }
}
