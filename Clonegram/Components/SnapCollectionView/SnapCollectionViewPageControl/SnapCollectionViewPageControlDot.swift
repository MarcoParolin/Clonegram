//
//  SnapCollectionViewPageControlDot.swift
//  Clonegram
//
//  Created by Marco Parolin on 30/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

enum SnapCollectionViewPageControlDotDimension {
    case big
    case medium
    case small
    case hidden
}

class SnapCollectionViewPageControlDot: UIView {
    
    var isSelected: Bool = false //{ didSet { update() } }
    var dimension: SnapCollectionViewPageControlDotDimension = .big //{ didSet { update() } }
    var position: Int?
    
    private var dotLayer = CAShapeLayer()
    
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
        self.backgroundColor = .clear
        self.snp.makeConstraints { (make) in
            make.height.equalTo(6)
            make.width.equalTo(6)
            if let superview = self.superview {
                make.centerX.centerY.equalTo(superview)
            }
        }
        
        self.layer.addSublayer(dotLayer)
        
        dotLayer.path = CGPath(ellipseIn: CGRect(x: 0, y: 0, width: 6, height: 6), transform: nil)
        dotLayer.fillColor = UIColor.clear.cgColor
        dotLayer.opacity = 1
        self.dotLayer.frame = self.bounds
    }
    
    func checkIfSelected(withIndex index: Int) {
        self.isSelected = index == (position ?? -1)
    }
    
    private func update() {
        self.dotLayer.frame = self.bounds
    }
    
    func animateTransition() {
    
        var dotDim: CGFloat = 0
        switch self.dimension {
        case .big:
            dotDim = 6
        case .medium:
            dotDim = 3
        case .small:
            dotDim = 1
        case .hidden:
            dotDim = 0
        }
        
        let offset = (6 - dotDim)/2
        
        CATransaction.begin()
        
        let targetPath = CGPath(ellipseIn: CGRect(x: offset, y: offset, width: dotDim, height: dotDim), transform: nil)
        let pathAnimation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.path))
        pathAnimation.fromValue = dotLayer.path
        pathAnimation.toValue = targetPath
        
        let targetColor = (isSelected ? R.color.brandBlue() : R.color.storiesReadColor())?.cgColor
        let colorAnimation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.fillColor))
        colorAnimation.fromValue = dotLayer.fillColor
        colorAnimation.toValue = targetColor

        let targetOpacity: Float = (dimension == .hidden) ? 0 : 1
        let opacityAnimation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.opacity))
        opacityAnimation.fromValue = dotLayer.opacity
        opacityAnimation.toValue = targetOpacity

        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = 0.2
        groupAnimation.isRemovedOnCompletion = false
        groupAnimation.fillMode = .forwards
        groupAnimation.animations = [pathAnimation, colorAnimation, opacityAnimation]
        
        CATransaction.setCompletionBlock {
            self.dotLayer.path = targetPath
            self.dotLayer.fillColor = targetColor
            self.dotLayer.opacity = targetOpacity
        }
        
        self.dotLayer.add(groupAnimation, forKey: "animation")
        CATransaction.commit()
        
    }
    
}
