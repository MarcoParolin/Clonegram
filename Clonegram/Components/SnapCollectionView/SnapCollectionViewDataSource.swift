//
//  SnapCollectionViewDataSource.swift
//  Clonegram
//
//  Created by Marco Parolin on 24/05/2019.
//  Copyright © 2019 Marco Parolin. All rights reserved.
//

import Foundation
import UIKit

class SnapCollectionViewDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var items: [MediaURL]
    weak var collectionView: SnapCollectionView?
    var currentItemDisplayedIndex: Int?
    
    init(items: [MediaURL]) {
        self.items = items
        super.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let baseCell = collectionView.dequeueReusableCell(withReuseIdentifier: SnapCollectionViewCell.reuseIdentifier(), for: indexPath)
        guard let cell = baseCell as? SnapCollectionViewCell else {
            return baseCell
        }
        cell.setupCell(with: items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let dim = collectionView.bounds.height
        return CGSize(width: dim, height: dim)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let collectionView = collectionView else { return }
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint)
        if let index = visibleIndexPath?.item, currentItemDisplayedIndex != index {
            self.currentItemDisplayedIndex = index
            collectionView.snapDelegate?.didDisplayItemAt(index: index)
        }
    }
//
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        guard let collectionView = collectionView else { return }
//        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
//        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
//        let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint)
//        if let index = visibleIndexPath?.item {
//            collectionView.snapDelegate?.didDisplayItemAt(index: index)
//        }
//    }
    
}
