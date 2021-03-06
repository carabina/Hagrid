//
//  Padding.swift
//  Hagrid
//
//  Created by Ondrej Rafaj on 29/05/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

@_exported import Foundation


/// Element padding
public enum Padding {
    
    /// None
    case none
    
    /// Top
    case top(CGFloat)
    
    /// Left
    case left(CGFloat)
    
    /// Right
    case right(CGFloat)
    
    /// Sides (left, right)
    case horizontal(left: CGFloat, right: CGFloat)
    
    /// Full (top, left, right, bottom)
    case full(top: CGFloat, left: CGFloat, right: CGFloat)
    
}


extension Padding {
    
    #if os(iOS) || os(tvOS)
    typealias EdgeInsetsAlias = UIEdgeInsets
    #elseif os(OSX)
    typealias EdgeInsetsAlias = NSEdgeInsets
    #endif
    
    /// UIEdgeInsets representation
    var value: EdgeInsetsAlias {
        switch self {
        case .top(let top):
            return EdgeInsetsAlias(top: top, left: 0, bottom: 0, right: 0)
        case .left(let left):
            return EdgeInsetsAlias(top: 0, left: left, bottom: 0, right: 0)
        case .right(let right):
            return EdgeInsetsAlias(top: 0, left: 0, bottom: 0, right: right)
        case .horizontal(let left, let right):
            return EdgeInsetsAlias(top: 0, left: left, bottom: 0, right: right)
        case .full(let top, let left, let right):
            return EdgeInsetsAlias(top: top, left: left, bottom: 0, right: right)
        case .none:
            return EdgeInsetsAlias(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
    
}
