//
//  CicularGradientLayer.swift
//  Clonegram
//
//  Created by Marco Parolin on 23/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation
import UIKit

class CircularGradientLayer: CALayer {
    
    var isRead: Bool = false {
        didSet {
            update()
        }
    }
    
    private var gradientLayer = CAGradientLayer()
    private var maskLayer = CAShapeLayer()
    
    private var stepDimension: CGFloat {
        return self.bounds.width / 13
    }
    
    private var outerEdgeDiameter: CGFloat {
        return self.bounds.width + stepDimension * 2.25
    }
    
    private var innerEdgeDiameter: CGFloat {
        return self.bounds.width + (isRead ? (stepDimension * 1.75) : stepDimension )
    }
    
    private var gradientColor: [CGColor] {
        return isRead ? Colors.storiesReadGradient.asCGColors() : Colors.storiesGradient.asCGColors()
    }
    
    override init() {
        super.init()
        setup()
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func layoutSublayers() {
        super.layoutSublayers()
        update()
    }
    
    private func setup() {
        gradientLayer.type = .axial
        gradientLayer.colors = gradientColor
//        gradientLayer.locations = [0.5,0.5]
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)

        maskLayer.fillColor = UIColor.blue.cgColor
        maskLayer.fillRule = .evenOdd
        gradientLayer.mask = maskLayer
        self.addSublayer(gradientLayer)
    }
    
    private func update() {
        gradientLayer.colors = gradientColor
        
        let outerRect = CGRect(x: 0, y: 0, width: outerEdgeDiameter, height: outerEdgeDiameter)
        gradientLayer.frame = outerRect
        gradientLayer.position = self.position
        gradientLayer.cornerRadius = outerEdgeDiameter / 2
        
        maskLayer.frame = CGRect(x: 0, y: 0, width: outerEdgeDiameter, height: outerEdgeDiameter)
//        maskLayer.position = self.position
        let maskPath = UIBezierPath(ovalIn: outerRect)
        let strokeDimension = (outerEdgeDiameter - innerEdgeDiameter) / 2
        let circlePath = UIBezierPath(ovalIn: CGRect(x: strokeDimension, y: strokeDimension, width: innerEdgeDiameter, height: innerEdgeDiameter))
        maskPath.append(circlePath)
        maskPath.usesEvenOddFillRule = true
        maskLayer.path = maskPath.cgPath
    }
    
}
