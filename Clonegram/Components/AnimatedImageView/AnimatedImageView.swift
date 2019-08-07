//
//  AnimatedImageView.swift
//  Clonegram
//
//  Created by Marco Parolin on 05/06/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import UIKit

enum ImageViewAnimationType {
    case heartBeatIn
}

class AnimatedImageView: UIImageView {
    
    var _isAnimating: Bool = false

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
        
    }
    
    private func update() {
        
    }
    
    func animate(_ animationType: ImageViewAnimationType) {
        guard !_isAnimating else { return }
        switch animationType {
        case .heartBeatIn:
            animateHeartBeatIn()
        }
    }
    
    private func animateHeartBeatIn() {
        _isAnimating = true
//        self.transform = CGAffineTransform(scaleX: 0, y: 0)
//        self.alpha = 0
//        UIView.animateKeyframes(withDuration: 2, delay: 0, options: .calculationModePaced, animations: {
//
//            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.15) {
//                self.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
//            }
//
//            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.05) {
//                self.alpha = 1
//            }
//
//            UIView.addKeyframe(withRelativeStartTime: 0.15, relativeDuration: 0.2) {
//                self.transform = CGAffineTransform(scaleX: 1, y: 1)
//            }
//
//            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.25) {
//                self.alpha = 0
//                self.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
//            }
//        }) { _ in
//            self._isAnimating = false
//        }
        
//        let scaleInAnimation = CASpringAnimation(keyPath: "transform")
//        scaleInAnimation.fromValue = CATransform3DMakeScale(0, 0, 1)
//        scaleInAnimation.toValue = CATransform3DMakeScale(1, 1, 1)
//        scaleInAnimation.damping = 2.0
//        scaleInAnimation.initialVelocity = 6.0
//
//        let opacityInAnimation = CABasicAnimation(keyPath: "opacity")
//        opacityInAnimation.fromValue = 0
//        opacityInAnimation.duration = 0.3
//        opacityInAnimation.toValue = 1
//
//        let animationInGroup = CAAnimationGroup()
//        animationInGroup.animations = [scaleInAnimation, opacityInAnimation]
//        animationInGroup.duration = 1
//        animationInGroup.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
//        animationInGroup.fillMode = .forwards
//        animationInGroup.isRemovedOnCompletion = false
//
//
//        layer.add(animationInGroup, forKey: nil)
//
//        let scaleOutAnimation = CABasicAnimation(keyPath: "transform")
//        scaleOutAnimation.fromValue = CATransform3DMakeScale(1, 1, 1)
//        scaleOutAnimation.toValue = CATransform3DMakeScale(0.5, 0.5, 1)
//
//        let opacityOutAnimation = CABasicAnimation(keyPath: "opacity")
//        opacityOutAnimation.fromValue = 1
//        opacityOutAnimation.duration = 1
//        opacityOutAnimation.toValue = 0
//
//
//        let animationOutGroup = CAAnimationGroup()
//        animationOutGroup.animations = [scaleOutAnimation, opacityOutAnimation]
//        animationOutGroup.duration = 1
//        animationOutGroup.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
//        animationOutGroup.fillMode = .forwards
//        animationOutGroup.isRemovedOnCompletion = false
//        animationOutGroup.beginTime = 3
//
//
//        layer.add(animationOutGroup, forKey: nil)
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
//            self._isAnimating = false
//        }
        
        self.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 3.0, options: .curveEaseInOut, animations: {() -> Void in
            self.transform = .identity
            self.alpha = 1
        }, completion: {(_ /* finished */: Bool) -> Void in
            // do something once the animation finishes, put it here
            UIView.animate(withDuration: 0.5, delay: 1, options: .curveEaseOut, animations: {() -> Void in
                self.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                self.alpha = 0
            }, completion: {(_ /* finished */: Bool) -> Void in
                self._isAnimating = false
            })
        })
    }

}
