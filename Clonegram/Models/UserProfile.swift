//
//  User.swift
//  Clonegram
//
//  Created by Marco Parolin on 14/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation
import UIKit
import NetworkManager

class UserProfile {
    
    var userId: UUID
    var profilePictureMedia: MediaURL
    var username: String
    var userStory: UserStory
    
    var hasStories: Bool {
        return !userStory.stories.isEmpty
    }

    public init(userId: UUID, profilePictureMedia: MediaURL, username: String, userStory: UserStory) {
        self.profilePictureMedia = profilePictureMedia
        self.userId = userId
        self.username = username
        self.userStory = userStory
    }
    
    public init(user: User) {
        self.profilePictureMedia = MediaURL(URL(string: user.picture.thumb), .image)
        self.userId = UUID(uuidString: user.id.value) ?? UUID()
        self.username = user.username
        let storyPlaceholder = Story(image: [R.image.imagePlaceholder()].compactMap({$0}))
        let mockStories = Bool.random() ? [] : [storyPlaceholder]
        self.userStory = UserStory(stories: mockStories)
    }
}

extension Array where Element: User {
    var asUserProfiles: [UserProfile] {
        return self.map { UserProfile(user: $0) }
    }
}
