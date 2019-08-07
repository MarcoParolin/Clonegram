//
//  SnapCollectionViewCell.swift
//  Clonegram
//
//  Created by Marco Parolin on 24/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import UIKit
import SwiftVideoBackground
import SnapKit

class SnapCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var videoContainer: UIView!
    @IBOutlet var muteButton: ButtonWithIcon!
    
    private var media: MediaURL?
    var videoInstance: VideoBackground?
    
    private var isVideoPlaying: Bool = false

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupCell(with media: MediaURL) {
        self.media = media
        switch media.mediaType {
        case .image:
            imageView.sd_setImage(with: media.url, completed: nil)
            imageView.isHidden = false
            videoContainer.isHidden = true
        case .video:
            guard let url = media.url else {
                imageView.image = R.image.imagePlaceholder()
                imageView.isHidden = false
                videoContainer.isHidden = true
                return
            }
            setupVideo(wirh: url)
            imageView.isHidden = true
            videoContainer.isHidden = false
            
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapVideo))
            videoContainer.addGestureRecognizer(tapGestureRecognizer)
        }
    }
    
    func setupVideo(wirh url: URL) {
        self.videoInstance = VideoBackground()
        videoInstance?.play(view: videoContainer, url: url)
        videoInstance?.willLoopVideo = true
        videoInstance?.isMuted = true
        isVideoPlaying = true
        
    }
    
    @objc private func didTapVideo() {
        if isVideoPlaying {
            print("STOP VIDEO")
            videoInstance?.pause()
            isVideoPlaying = false
        } else {
            print("PLAY VIDEO")
            videoInstance?.resume()
            isVideoPlaying = true
        }
    }
    
    @IBAction func muteButtonAction(_ sender: UIButton) {
        videoInstance?.isMuted = !muteButton.isSelected
    }
}
