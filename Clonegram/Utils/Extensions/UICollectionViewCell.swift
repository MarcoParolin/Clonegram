//
//  UICollectionViewCell.swift
//  Clonegram
//
//  Created by Marco Parolin on 24/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    static func reuseIdentifier() -> String {
        return String(describing: self)
    }
}
