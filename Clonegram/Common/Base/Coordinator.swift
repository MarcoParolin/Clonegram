//
//  Coordinator.swift
//  Clonegram
//
//  Created by Marco Parolin on 09/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation
import UIKit

public protocol Coordinator: class {
    var rootViewController: UIViewController { get }
}
