//
//  PostDescriptionLabel.swift
//  Clonegram
//
//  Created by Marco Parolin on 20/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation
import UIKit

class PostDescriptionLabel: ActiveLabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        update()
    }
    
    private func setup() {
        self.enabledTypes = [.mention, .hashtag, .url, .username, .more]
        self.mentionColor = R.color.mentionColor() ?? Colors.mentionColor
        self.hashtagColor = R.color.hashtagColor() ?? Colors.hashtagColor
        self.URLColor = R.color.linkColor() ?? Colors.linkColor
        self.usernameColor = UIColor.black
        self.moreColor = Colors.moreColor
        self.usernameFont = UIFont.systemFont(ofSize: 13, weight: .semibold)
//        self.customFont[.username] = UIFont.systemFont(ofSize: 13, weight: .bold)
    }
    
    private func update() {
        
    }
}
