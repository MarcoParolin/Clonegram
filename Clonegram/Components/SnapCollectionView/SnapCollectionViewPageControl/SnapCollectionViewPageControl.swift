//
//  SnapCollectionViewPageControl.swift
//  Clonegram
//
//  Created by Marco Parolin on 30/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation
import UIKit

class SnapCollectionViewPageControl: BaseComponent {
    
    @IBOutlet var scrollView: UIScrollView?
    @IBOutlet var stackView: UIStackView?
    @IBOutlet var shouldCenterDots: NSLayoutConstraint?
    
    private let dotWidth: CGFloat = 12
    private let pageDisplayedLimit: Int = 5
    private var numberOfPages: Int = 0
    private var currentPageIndex: Int = -1 {
        didSet {
            handleDotDisplay()
            handleDotDimensions()
            handleDotColors()
        }
    }
    
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
        self.stackView?.removeAllArrangedSubviews()
        isUserInteractionEnabled = false
    }
    
    func setup(numberOfPages: Int, currentPageIndex: Int = 0) {
        self.numberOfPages = numberOfPages
        
        stackView?.spacing = 6
        stackView?.alignment = .center
        stackView?.distribution = .fillEqually
        
        self.scrollView?.contentOffset.x = 0
        self.stackView?.removeAllArrangedSubviews()
        for index in 0...(numberOfPages - 1) {
            let dotView = SnapCollectionViewPageControlDot()
            dotView.position = index
            self.stackView?.addArrangedSubview(dotView)
        }
        
        shouldCenterDots?.isActive = numberOfPages <= pageDisplayedLimit
        self.currentPageIndex = currentPageIndex
    
        self.alpha = 0
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.alpha = 1
        }
    }
    
    func setCurrentIndex(_ index: Int) {
        guard index <= (numberOfPages - 1), index <= (stackView?.arrangedSubviews.count ?? 0) else { return }
        self.currentPageIndex = index
    }
    
    private func update() {
        handleDotDisplay()
        handleDotDimensions()
        handleDotColors()
    }
    
//    private func initializeDotDisplay() {
//        guard numberOfPages > 5 else { return }
//        self.scrollView?.contentOffset.x = -((dotWidth*3) + 3)
//    }
    
    private func handleDotDisplay() {
        guard numberOfPages > pageDisplayedLimit else { return }
        switch dotPosition() {
        case .first, . second:
            self.scrollView?.setContentOffset(CGPoint(x: -((dotWidth*2) + 3), y: 0), animated: true)
            return
//        case .second:
//            self.scrollView?.setContentOffset(CGPoint(x: -(dotWidth*2), y: 0), animated: true)
//            return
//        case .third:
//            self.scrollView?.setContentOffset(CGPoint(x: -(dotWidth), y: 0), animated: true)
//            return
//        case .last:
//            return
        default:
            break
        }
        guard currentPageIndex < (numberOfPages - 1) else { return }
        self.scrollView?.setContentOffset(CGPoint(x: (dotWidth*CGFloat(currentPageIndex - 3) - 3), y: 0), animated: true)
    }
    
    private func handleDotColors() {
        self.stackView?.arrangedSubviews.forEach({ view in
            guard let view = view as? SnapCollectionViewPageControlDot else { return }
            view.checkIfSelected(withIndex: currentPageIndex)
            view.animateTransition()
        })
    }
    
    private func handleDotDimensions() {
        
        guard numberOfPages > pageDisplayedLimit else { return }
        
        for (index, subview) in (stackView?.arrangedSubviews ?? []).enumerated() {
            guard let dotView = subview as? SnapCollectionViewPageControlDot else { return }
            let varietyIndex = ((dotPosition() == .first) || (dotPosition() == .last)) ? 1 : 0
            if index <= (currentPageIndex + 1 + varietyIndex) && index >= (currentPageIndex - 1 - varietyIndex) {
                dotView.dimension = .big
            } else if (index == currentPageIndex + 2 + varietyIndex) || (index == currentPageIndex - 2 - varietyIndex) {
                dotView.dimension = .medium
            } else if (index == currentPageIndex + 3 + varietyIndex) || (index == currentPageIndex - 3 - varietyIndex) {
                dotView.dimension = .small
            } else {
                dotView.dimension = .hidden
            }
        }
    }
    
    func dotPosition() -> DotPosition {
        // is first
        if currentPageIndex == 0 {
            return .first
        }
        // is Second
        if currentPageIndex == 1 {
            return .second
        }
        // is third
        if currentPageIndex == 2 {
            return .third
        }
        // is thirdlast
        if currentPageIndex == (numberOfPages - 3) {
            return .thirdLast
        }
        // is secondlast
        if currentPageIndex == (numberOfPages - 2) {
            return .secondLast
        }
        // is last
        if currentPageIndex == (numberOfPages - 1) {
            return .last
        }
        return .center
    }
    
}
