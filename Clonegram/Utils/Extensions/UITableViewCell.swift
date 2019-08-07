//
//  UITableViewCell.swift
//  Clonegram
//
//  Created by Marco Parolin on 20/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    static func reuseIdentifier() -> String {
        return String(describing: self)
    }
}
