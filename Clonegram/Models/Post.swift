//
//  Post.swift
//  Clonegram
//
//  Created by Marco Parolin on 14/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation
import UIKit

class Post {
    
    var author: UserProfile
    var location: Location
    
    var media: [MediaURL]
    
    var likesCount: Int
    var postCaption: String
    var comments: [Comment]
    var creationDate: Date
    
    // Cell falgs
    var hasExpandedCaption: Bool?
    var hasLiked: Bool?

    public init(author: UserProfile, location: Location, media: [MediaURL], likesCount: Int, postCaption: String, comments: [Comment], creationDate: Date) {
        self.author = author
        self.location = location
        self.media = media
        self.likesCount = likesCount
        self.postCaption = postCaption
        self.comments = comments
        self.creationDate = creationDate
    }
    
}
