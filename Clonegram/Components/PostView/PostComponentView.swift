//
//  PostComponentView.swift
//  Clonegram
//
//  Created by Marco Parolin on 14/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class PostComponentView: BaseComponent {
    
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var profilePicture: ProfilePicture!
//    @IBOutlet var image: UIImageView!
    @IBOutlet var picturesCollectionView: SnapCollectionView!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var commentButton: UIButton!
    @IBOutlet var shareButton: UIButton!
    @IBOutlet var picturesSetPageControl: SnapCollectionViewPageControl!
    @IBOutlet var mediaOverlayCounter: OverlayInfoLabel!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var likesLabel: UILabel!
    @IBOutlet var descriptionLabel: PostDescriptionLabel!
    @IBOutlet var viewCommentsButton: UIButton!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet weak var pageControlWidth: NSLayoutConstraint!
    @IBOutlet weak var didDoubleTapImageView: AnimatedImageView!
    
    private var mediaDataSource: SnapCollectionViewDataSource?
    
    private var viewModel: PostComponentViewModel {
        guard let vm = baseViewModel as? PostComponentViewModel else {
            fatalError("Wrong ViewModel")
        }
        return vm
    }
    
    func setup(with viewModel: PostComponentViewModel, uiDelegate: BaseComponentDelegate? = nil) {
        super.setup(with: viewModel, uiDelegate: uiDelegate)
        let dataSource = SnapCollectionViewDataSource(items: viewModel.post.media)
        mediaDataSource = dataSource
        updateUI()
        setupDoubleTapToLike()
    }
    
    override func updateUI() {
        usernameLabel.text = viewModel.post.author.username
        locationLabel.text = viewModel.post.location.name
        profilePicture.mediaURL = viewModel.post.author.profilePictureMedia
        profilePicture.hasStory = viewModel.post.author.hasStories

        setupMediaCollectionView()
        
        likeButton.isSelected = viewModel.post.hasLiked ?? false
        likesLabel.text = viewModel.likesText
        descriptionLabel.text = viewModel.captionText
        viewCommentsButton.setTitle(viewModel.commentsButtonText, for: .normal)
        dateLabel.text = viewModel.dateText
        
        descriptionLabel.handleMentionTap({ tappedElement in
            print("Mention at \(tappedElement)")
        })
        descriptionLabel.handleHashtagTap({ tappedElement in
            print("Hash -> \(tappedElement)")
        })
        descriptionLabel.handleURLTap({ tappedElement in
            print("Web to: \(tappedElement)")
        })
        descriptionLabel.handleUsernameTap({ tappedElement in
            print("Open user profile: \(tappedElement)")
        })
        descriptionLabel.handleMoreTap({ [weak self] tappedElement in
            print("Tapped element: \(tappedElement)")
            self?.viewModel.shouldTrimCaption = false
            self?.uiDelegate?.didChange()
            self?.viewModel.post.hasExpandedCaption = true
        })
        
    }
    
    @IBAction func likeAction(_ sender: UIButton) {
        viewModel.post.hasLiked = sender.isSelected
    }
    @IBAction func commentAction(_ sender: UIButton) {
    }
    @IBAction func shareAction(_ sender: UIButton) {
    }
    @IBAction func bookmarkAction(_ sender: UIButton) {
    }
    
    override func dataLoaded() {
        descriptionLabel.text = viewModel.captionText
        descriptionLabel.layoutIfNeeded()
    }
    
    private func setupMediaCollectionView() {
        
        mediaDataSource?.items = viewModel.post.media
        picturesCollectionView.register(UINib(nibName: R.nib.snapCollectionViewCell.name, bundle: nil), forCellWithReuseIdentifier: SnapCollectionViewCell.reuseIdentifier())
        picturesCollectionView.dataSource = mediaDataSource
        picturesCollectionView.delegate = mediaDataSource
        mediaDataSource?.collectionView = picturesCollectionView
        mediaDataSource?.currentItemDisplayedIndex = 0
        picturesCollectionView.snapDelegate = self
        
        picturesSetPageControl.isHidden = !viewModel.shouldDisplayPage
        mediaOverlayCounter.isHidden = !viewModel.shouldDisplayPage
        picturesCollectionView.contentOffset.x = 0
        picturesSetPageControl.setup(numberOfPages: viewModel.numberOfMediaPages, currentPageIndex: 0)
        picturesSetPageControl.scrollView?.contentOffset.x = 0
        mediaOverlayCounter.text = "1/\(viewModel.numberOfMediaPages)"
    }
    
    private func setupDoubleTapToLike() {
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(didDoubleTap))
        doubleTap.numberOfTapsRequired = 2
        
        picturesCollectionView.addGestureRecognizer(doubleTap)
    }
    
    @objc private func didDoubleTap() {
        didDoubleTapImageView.animate(.heartBeatIn)
    }
}

extension PostComponentView: SnapCollectionViewDelegate {
    func didDisplayItemAt(index: Int) {
        picturesSetPageControl.setCurrentIndex(index)
        mediaOverlayCounter.text = "\(index + 1)/\(viewModel.numberOfMediaPages)"
    }
}
