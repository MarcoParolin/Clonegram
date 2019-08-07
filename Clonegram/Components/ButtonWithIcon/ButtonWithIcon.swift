//
//  ButtonWithIcon.swift
//  Clonegram
//
//  Created by Marco Parolin on 21/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class ButtonWithIcon: UIButton {
    
    @IBInspectable var toggable: Bool = false
    
    override var isSelected: Bool {
        didSet {
            if toggable {
                let image = isSelected ? selectedImage : unselectedImage
                self.setImage(image, for: .normal)
            }
        }
    }
    
    @IBInspectable var selectedImage: UIImage?
    private var unselectedImage: UIImage?
    
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
        self.unselectedImage = self.imageView?.image
        self.imageView?.contentMode = .scaleAspectFit
        
        self.addTarget(self, action: #selector(toggleSelected), for: .touchUpInside)
    }
    
    private func update() {
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    @objc private func toggleSelected() {
        self.isSelected = !self.isSelected
    }
}
