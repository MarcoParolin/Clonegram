//
//  Comment.swift
//  Clonegram
//
//  Created by Marco Parolin on 14/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation
import UIKit

class Comment {
    
    var author: UserProfile
    var text: String

    public init(author: UserProfile, text: String) {
        self.author = author
        self.text = text
    }
}
