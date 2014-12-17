//
//  FlowLayout.swift
//  AdvancedCollectionView
//
//  Created by Zachary Waldowski on 12/15/14.
//  Copyright (c) 2014 Apple. All rights reserved.
//

import Foundation

public final class FlowLayout: UICollectionViewLayout {
    
    internal func sectionArrayIndex(forIndexPath indexPath: NSIndexPath) -> Int {
//        r15 = *objc_msgSend;
//        rbx = [arg2 section];
//        rax = [self _sections];
//        rax = [rax firstIndex];
//        rax = rbx - rax;
//        return rax;
        return 0
    }
    
}
