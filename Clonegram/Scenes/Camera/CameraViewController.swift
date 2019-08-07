//
//  CameraViewController.swift
//  Clonegram
//
//  Created by Marco Parolin on 09/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import UIKit

class CameraViewController: BaseViewController<CameraCoordinator, CameraViewModel> {
    
    override var shouldBeDisplayedAsModal: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
