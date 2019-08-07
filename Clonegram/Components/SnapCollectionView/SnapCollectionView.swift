//
//  SnapCollectionView.swift
//  Clonegram
//
//  Created by Marco Parolin on 24/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import UIKit

protocol SnapCollectionViewDelegate: class {
    func didDisplayItemAt(index: Int)
}

class SnapCollectionView: UICollectionView {
    
    weak var snapDelegate: SnapCollectionViewDelegate?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setup()
    }
    
    init() {
        super.init(frame: .zero, collectionViewLayout: SnapCollectionViewLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.collectionViewLayout = SnapCollectionViewLayout()
        setup()
    }
    
    private func setup() {
        self.isPagingEnabled = true
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
    }
    
}
