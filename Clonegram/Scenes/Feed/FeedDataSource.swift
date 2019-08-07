//
//  FeedDataSource.swift
//  Clonegram
//
//  Created by Marco Parolin on 20/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import UIKit

class FeedDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var posts: [Post] = []
    
    weak var tableView: UITableView?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let baseCell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.reuseIdentifier(), for: indexPath)
        guard let cell = baseCell as? PostTableViewCell else { return baseCell }
//        let viewModel = PostComponentViewModel(post: posts[indexPath.row])
//        cell.setup(with: viewModel, uiDelegate: self)
        cell.setupCell(with: posts[indexPath.row], uiDelegate: self)
        return cell
    }
}

extension FeedDataSource: BaseComponentDelegate {
    func didChange() {
        UIView.animate(withDuration: 0.2) {
            self.tableView?.beginUpdates()
            self.tableView?.endUpdates()
        }
    }
}
