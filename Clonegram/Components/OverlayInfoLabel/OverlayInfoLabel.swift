//
//  OverlayInfoLabel.swift
//  Clonegram
//
//  Created by Marco Parolin on 31/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation
import UIKit

class OverlayInfoLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        update()
    }
    
    private func setup() {
        self.textAlignment = .center
        self.textColor = .white
        self.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    }
    
    private func update() {
        self.layer.cornerRadius = self.bounds.height / 2
        self.layer.masksToBounds = true
    }
    
}
