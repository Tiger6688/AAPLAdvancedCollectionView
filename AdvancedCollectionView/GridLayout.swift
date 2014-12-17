//
//  GridLayout.swift
//  AdvancedCollectionView
//
//  Created by Zachary Waldowski on 12/14/14.
//  Copyright (c) 2014 Apple. All rights reserved.
//

import UIKit


public protocol CollectionViewDataSourceGridLayout: UICollectionViewDataSource {
    
    /// Measure variable height cells. The goal here is to do the minimal necessary configuration to get the correct size information.
    func sizeFittingSize(size: CGSize, itemAtIndexPath indexPath: NSIndexPath, collectionView: UICollectionView) -> CGSize
    
    /// Measure variable height supplements. The goal here is to do the minimal necessary configuration to get the correct size information.
    func sizeFittingSize(size: CGSize, supplementaryElementOfKind kind: String, indexPath: NSIndexPath, collectionView: UICollectionView) -> CGSize
    
    /// Compute a flattened snapshot of the layout metrics associated with this and any child data sources.
    func snapshotMetrics() -> [Section : SectionMetrics]
    
    /// Determine whether or not a cell is editable. Default implementation returns YES.
    func canEditItem(atIndexPath indexPath: NSIndexPath, collectionView: UICollectionView) -> Bool
    
    /// Determine whether or not the cell is movable. Default implementation returns NO.
    func canMoveItem(atIndexPath indexPath: NSIndexPath, collectionView: UICollectionView) -> Bool
    
    /// Determine whether an item may be moved from its original location to a proposed location. Default implementation returns NO.
    func canMoveItem(fromIndexPath indexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath, collectionView: UICollectionView) -> Bool
    
    /// Called by the collection view to alert the data source that an item has been moved. The data source should update its contents.
    func moveItem(from indexPath: NSIndexPath, to destinationIndexPath: NSIndexPath, collectionView: UICollectionView)

}

// MARK: -

private struct CacheKey {
    let indexPath: NSIndexPath
    let kind: String
}

private func ==(lhs: CacheKey, rhs: CacheKey) -> Bool {
    return lhs.kind != rhs.kind ||
        lhs.indexPath === rhs.indexPath ||
        lhs.indexPath == rhs.indexPath
}

extension CacheKey: Equatable {}

extension CacheKey: Hashable {
    
    var hashValue: Int {
        return 31 &* indexPath.hashValue &+ kind.hashValue
    }
    
}

extension CacheKey: DebugPrintable {
    
    var debugDescription: String {
        let commaSeparated = join(", ", map(indexPath) { String($0) })
        return "\(kind)@{\(commaSeparated)}"
    }
    
}

// MARK: -

public class GridLayout: UICollectionViewLayout {
    
    public let DefaultRowHeight = CGFloat(44)
    public let ElementKindPlaceholder = "placeholder"
    public enum ZIndex: Int {
        case Item = 1
        case Supplement = 100
        case Decoration = 1000
        case SupplementPinned = 10000
    }
    
    // MARK:
    
    var isEditing: Bool = false {
        didSet {
            
        }
    }
    
    // MARK: Public methods
    
    public func invalidateLayout(forItemAtIndexPath indexPath: NSIndexPath) {
        // TODO:
    }
    
    public func invalidateLayoutForGlobalSection() {
        // TODO:
    }
    
    
    private var contentSizeAdjustment = CGSize.zeroSize
    private var contentOffsetAdjustment = CGPoint.zeroPoint
    
    public override func prepareLayout() {
        super.prepareLayout()
        
        contentSizeAdjustment = CGSize.zeroSize
        contentOffsetAdjustment = CGPoint.zeroPoint
        
        let bounds = collectionView.map { $0.bounds } ?? CGRect.zeroRect
        
        if !bounds.isEmpty {
            //[rbx _fetchItemsInfoForRect:rdx]
        }
    }
    
}
