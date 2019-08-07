//
//  Array.swift
//  Clonegram
//
//  Created by Marco Parolin on 20/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation

extension Array {
    var random: Element {
        guard let random = self.randomElement() else {
            fatalError("Tried to get random element from empty array")
        }
        return random
    }
}
