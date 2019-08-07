//
//  SnapCollectionViewLayout.swift
//  Clonegram
//
//  Created by Marco Parolin on 30/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import UIKit

class SnapCollectionViewLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.sectionInset = UIEdgeInsets.zero
        self.minimumLineSpacing = .zero
        self.minimumInteritemSpacing = .zero
        self.scrollDirection = .horizontal
    }
}
