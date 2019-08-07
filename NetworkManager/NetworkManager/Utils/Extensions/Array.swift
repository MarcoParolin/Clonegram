//
//  Array.swift
//  NetworkManager
//
//  Created by Marco Parolin on 14/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation

extension Array where Element == Result {
    var asUsers: [User] {
        return self.map { User(data: $0) }
    }
}
