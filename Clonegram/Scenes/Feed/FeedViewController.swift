//
//  FeedViewController.swift
//  Clonegram
//
//  Created by Marco Parolin on 09/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import UIKit

class FeedViewController: BaseViewController<FeedCoordinator, FeedViewModel> {
    
    @IBOutlet weak var postsTableView: UITableView!
    let dataSource = FeedDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.posts = viewModel.posts
        dataSource.tableView = postsTableView
        
//        postsTableView.register(UINib(nibName: String(describing: TextualBreadcrumbItemCell.classForCoder()), bundle: nil), forCellWithReuseIdentifier: TextualBreadcrumbItemCell.reuseIdentifier())
        
        postsTableView.register(UINib(nibName: R.nib.postTableViewCell.name, bundle: nil), forCellReuseIdentifier: PostTableViewCell.reuseIdentifier())
        postsTableView.rowHeight = UITableView.automaticDimension
        postsTableView.estimatedRowHeight = 200
        postsTableView.delegate = dataSource
        postsTableView.dataSource = dataSource
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
//            print("Reloading \(Mock.posts.count) posts")
//            self.postsTableView.reloadData()
//        }
    }
    
}
