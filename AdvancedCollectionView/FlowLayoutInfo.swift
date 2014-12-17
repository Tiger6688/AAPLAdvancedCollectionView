//
//  FlowLayoutInfo.swift
//  AdvancedCollectionView
//
//  Created by Zachary Waldowski on 12/15/14.
//  Copyright (c) 2014 Apple. All rights reserved.
//

import Foundation

final class FlowLayoutSection {
    
    func setSize(size: CGSize, forItemAtIndexPath indexPath: NSIndexPath) {

    }

}

final class FlowLayoutInfo {
    
    private(set) var sections = [FlowLayoutSection]()
    var layout: FlowLayout?
    var estimatesSizes = false
    var isHorizontal = false
    var isLeftToRight = true
    var usesFloatingHeaderFooter = false
    
    var dimension: CGFloat = 0
    var contentSize: CGSize = CGSize.zeroSize
    
//    var invalidatedIndexPaths = [NSIndexPath]() <- readonly
    
    private var isValid = false
    private var visibleBounds = CGRect.zeroRect
    private var layoutSize = CGSize.zeroSize
    private var rowAlignmentOptions: NSDictionary?
    
//    func copyWithZone(zone: NSZone) -> AnyObject {
//        
//    }
    
    func setSize(size: CGSize, forItemAtIndexPath indexPath: NSIndexPath) {
        if let index = layout?.sectionArrayIndex(forIndexPath: indexPath) {
            sections[index].setSize(size, forItemAtIndexPath: indexPath)
        }
    }
    
}