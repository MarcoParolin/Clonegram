//
//  String.swift
//  Clonegram
//
//  Created by Marco Parolin on 22/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation

extension String {
    
    func numberOfLines() -> Int {
        let ns = self as NSString
        var counter = 0
        ns.enumerateLines { _, _ in counter += 1 }
        return counter
    }
    
    func getTextFor(numberOfLines lines: Int) -> String {
        let ns = self as NSString
        var components: [String] = []
        ns.enumerateLines { (text, _) in
            if components.count < lines {
                components.append(text)
            }
        }
        return components.joined(separator: "\n")
    }
    
}
