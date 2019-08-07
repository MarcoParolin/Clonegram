//
//  PostComponentViewModel.swift
//  Clonegram
//
//  Created by Marco Parolin on 14/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation
import UIKit

class PostComponentViewModel: BaseComponentViewModel {
    
    private var captionCharLimit: Int = 50
    private var maxLinesCroppedCaption: Int = 2
    
    var post: Post
    var shouldTrimCaption: Bool = false {
        didSet {
            self.view?.dataLoaded()
        }
    }
    
    var likesText: String {
        return "\(post.likesCount) likes"
    }
    
    var captionText: String {
        guard (post.hasExpandedCaption ?? false) == false else {
            return fullCaptionText
        }
        return shouldTrimCaption ? trimmedCaptionText : fullCaptionText
    }
        
    private var fullCaptionText: String {
        return "\u{0001}\(post.author.username)\u{0002} \(post.postCaption)"
    }
    
    private var trimmedCaptionText: String {
        guard post.postCaption.numberOfLines() <= maxLinesCroppedCaption else {
            return "\u{0001}\(post.author.username)\u{0002} " + post.postCaption.getTextFor(numberOfLines: maxLinesCroppedCaption) + "...\u{0003}more\u{0004}"
        }
        return "\u{0001}\(post.author.username)\u{0002} \(post.postCaption.prefix(captionCharLimit)) ...\u{0003}more\u{0004}"
    }
    
    var commentsButtonText: String {
        return "View all \(post.comments.count) comments"
    }
    
    var dateText: String {
        // TODO: - Implement dinamic dates
        return "18 HOURS AGO"
    }
    
    var shouldDisplayPage: Bool {
        return numberOfMediaPages > 1
    }
    
    var numberOfMediaPages: Int {
        return self.post.media.count
    }
    
    init(post: Post) {
        self.post = post
        super.init()
    }
    
    override func setup() {
        self.shouldTrimCaption = shouldTrimCaption(post)
    }
    
    private func shouldTrimCaption(_ post: Post) -> Bool {
        let caption = post.postCaption
        guard caption.numberOfLines() <= maxLinesCroppedCaption else {
            return true
        }
        return caption.count >= captionCharLimit
    }
}
