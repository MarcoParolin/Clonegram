//
//  MediaURL.swift
//  Clonegram
//
//  Created by Marco Parolin on 24/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation

enum MediaType {
    case image
    case video
}

class MediaURL {
    
    var mediaType: MediaType
    var url: URL?
    
    init(_ url: URL?, _ type: MediaType) {
        self.url = url
        self.mediaType = type
    }
    
}
