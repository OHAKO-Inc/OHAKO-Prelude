//
//  CollectionViewFlowLayoutLeftAlign.swift
//  TagView
//
//  Created by Yoshikuni Kato on 2016/06/07.
//  Copyright © 2016年 Ohako Inc. All rights reserved.
//

import UIKit

public class CollectionViewFlowLayoutLeftAlign: UICollectionViewFlowLayout {
    
    private func insetForSection(at index: Int) -> UIEdgeInsets {
        guard let collectionView = collectionView,
            let sectionInset = (collectionView.delegate as? UICollectionViewDelegateFlowLayout)?.collectionView?(collectionView, layout: self, insetForSectionAt: index) else {
                return self.sectionInset
        }
        return sectionInset
    }

    private func minimumInteritemSpacingForSection(at index: Int) -> CGFloat {
        guard let collectionView = collectionView,
            let minimumInteritemSpacing = (collectionView.delegate as? UICollectionViewDelegateFlowLayout)?.collectionView?(collectionView, layout: self, minimumInteritemSpacingForSectionAt: index) else {
                return self.minimumInteritemSpacing
        }
        return minimumInteritemSpacing
    }

    public override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {

        guard let attributes = super.layoutAttributesForItem(at: indexPath)?.copy() as? UICollectionViewLayoutAttributes,
            let collectionViewWidth = collectionView?.frame.width else {
                return nil
        }

        let sectionLeftInset = insetForSection(at: indexPath.section).left

        guard indexPath.item > 0 else {
            attributes.frame.origin.x = sectionLeftInset
            return attributes
        }

        let currentColumnRect = CGRect(
            x: sectionLeftInset,
            y: attributes.frame.origin.y,
            width: collectionViewWidth - sectionInset.left - sectionInset.right,
            height: attributes.frame.height
        )
        guard let previousItemFrame = layoutAttributesForItem(at: IndexPath(item: indexPath.item - 1, section: indexPath.section))?.frame else {
            return nil
        }
        guard previousItemFrame.intersects(currentColumnRect) else {
            // new row
            attributes.frame.origin.x = sectionLeftInset
            return attributes
        }

        attributes.frame.origin.x = previousItemFrame.origin.x + previousItemFrame.width + minimumInteritemSpacingForSection(at: indexPath.section)
        return attributes
    }

    public override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributes = super.layoutAttributesForElements(in: rect) else {
            return nil
        }
        var attributesToReturn = attributes.flatMap { (attributes) -> UICollectionViewLayoutAttributes? in
            return attributes.copy() as? UICollectionViewLayoutAttributes
        }

        for (index, attr) in attributes.enumerated() where attr.representedElementCategory == .cell {
            attributesToReturn[index] = layoutAttributesForItem(at: attr.indexPath) ?? UICollectionViewLayoutAttributes()
        }
        return attributesToReturn
    }

}
