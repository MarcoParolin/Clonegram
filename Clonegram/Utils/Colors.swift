//
//  Colors.swift
//  Clonegram
//
//  Created by Marco Parolin on 20/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation
import UIKit

struct Colors {
    static var mentionColor: UIColor = UIColor(red: 0.00, green: 0.40, blue: 0.80, alpha: 1.0)
    static var hashtagColor: UIColor = UIColor(red: 0.00, green: 0.40, blue: 0.80, alpha: 1.0)
    static var linkColor: UIColor = UIColor(red: 0.00, green: 0.40, blue: 0.80, alpha: 1.0)
    static var moreColor: UIColor = .lightGray
    
    static var storiesGradient = [R.color.brandStrongPurple(),
                                  R.color.brandStrongPink(),
                                  R.color.brandDarkPink(),
                                  R.color.brandDarkRed(),
                                  R.color.brandLightOrangeAlt(),
                                  R.color.brandYellow()
        ].compactMap({ $0 })
    
    static var storiesReadGradient = [R.color.storiesReadColor(),
                                      R.color.storiesReadColor()
        ].compactMap({ $0 })
    
    static var brandColors = [R.color.brandBlue(),
                              R.color.brandLightNavy(),
                              R.color.brandStrongPurple(),
                              R.color.brandStrongPink(),
                              R.color.brandDarkPink(),
                              R.color.brandDarkRed(),
                              R.color.brandLightOrange(),
                              R.color.brandLightOrangeAlt(),
                              R.color.brandOrange(),
                              R.color.brandYellow(),
                              R.color.brandBlue()
    ]
}

extension Array where Element: UIColor {
    func asCGColors() -> [CGColor] {
        return self.map({ $0.cgColor })
    }
}
