//
//  PostTableViewCell.swift
//  Clonegram
//
//  Created by Marco Parolin on 14/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet var postComponent: PostComponentView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(with post: Post, uiDelegate: BaseComponentDelegate? = nil) {
        let viewModel = PostComponentViewModel(post: post)
        postComponent.setup(with: viewModel, uiDelegate: uiDelegate)
        
    }
    
}
