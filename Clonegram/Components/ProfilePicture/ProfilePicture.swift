//
//  ProfilePicture.swift
//  Clonegram
//
//  Created by Marco Parolin on 23/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import UIKit
import SDWebImage

protocol ProfilePictureDelegate: class {
    func didTapPicture(sender: Any)
}

class ProfilePicture: UIView {
    
    @IBInspectable var image: UIImage? {
        didSet {
            self.imageView.image = image
        }
    }
    
    var mediaURL: MediaURL? {
        didSet {
            guard let mediaURL = mediaURL else { return }
            switch mediaURL.mediaType {
            case .image:
                self.imageView.sd_setImage(with: mediaURL.url, completed: nil)
            case .video:
                fatalError("TODO: Implement Video")
            }
        }
    }
    
    var hasStory: Bool = false {
        didSet {
            gradientLayer.opacity = hasStory ? 1 : 0
        }
    }
    
    var isStoryRead: Bool = false {
        didSet {
            gradientLayer.isRead = isStoryRead
        }
    }
    
    private var imageView = UIImageView()
    private var gradientLayer = CircularGradientLayer()
    weak var delegate: ProfilePictureDelegate?

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
        self.layer.addSublayer(gradientLayer)
        self.addSubview(imageView)
        imageView.isUserInteractionEnabled = false
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapPicture))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func update() {
        gradientLayer.frame = self.bounds
        imageView.frame = self.bounds
        imageView.layer.cornerRadius = self.bounds.width / 2
        imageView.layer.masksToBounds = true
        self.backgroundColor = .clear
    }
    
    @objc private func didTapPicture() {
        delegate?.didTapPicture(sender: self)
        isStoryRead = !isStoryRead
    }

}
