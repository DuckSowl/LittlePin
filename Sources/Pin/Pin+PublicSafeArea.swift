//
//  Pin+PublicSafeArea.swift
//  
//
//  Created by Anton Tolstov on 17.07.2020.
//

import UIKit

public extension Pin {
    
    // MARK: - Safe Area Edges
    
    public func topSafe(to other: UIView? = nil, be relation: Relation = .equal,
                        _ constant: CGFloat = 0) -> Pin {
        if #available(iOS 11.0, *) {
            return addConstraint(to: other, \.safeAreaLayoutGuide.topAnchor,
                                 with: relation, constant: constant)
        } else {
            // TODO: Add iOS 10 support
            return top(to: other, be: relation, constant)
        }
    }
    
    public func leftSafe(to other: UIView? = nil, be relation: Relation = .equal,
                         _ constant: CGFloat = 0) -> Pin {
        if #available(iOS 11.0, *) {
            return addConstraint(to: other, \.safeAreaLayoutGuide.leftAnchor,
                                 with: relation, constant: constant)
        } else {
            // TODO: Add iOS 10 support
            return left(to: other, be: relation, constant)
        }
    }
    
    public func rightSafe(to other: UIView? = nil, be relation: Relation = .equal,
                          _ constant: CGFloat = 0) -> Pin {
        if #available(iOS 11.0, *) {
            return addConstraint(to: other, \.safeAreaLayoutGuide.rightAnchor,
                                 with: relation, constant: -constant)
        } else {
            // TODO: Add iOS 10 support
            return right(to: other, be: relation, constant)
        }
    }
    
    public func bottomSafe(to other: UIView? = nil, be relation: Relation = .equal,
                           _ constant: CGFloat = 0) -> Pin {
        if #available(iOS 11.0, *) {
            return addConstraint(to: other, \.safeAreaLayoutGuide.bottomAnchor,
                                 with: relation, constant: -constant)
        } else {
            // TODO: Add iOS 10 support
            return bottom(to: other, be: relation, constant)
        }
    }
    
    // MARK: - Safe Area Convenience shortcuts
    
    public func sidesSafe(to other: UIView? = nil, be relation: Relation = .equal,
                          _ constant: CGFloat = 0) -> Pin {
        if #available(iOS 11.0, *) {
            return self.leftSafe(to: other, be: relation, constant)
                       .rightSafe(to: other, be: relation, constant)
        } else {
            // TODO: Add iOS 10 support
            return sides(to: other, be: relation, constant)
        }
    }
    
    public func topBottomSafe(to other: UIView? = nil, be relation: Relation = .equal,
                              _ constant: CGFloat = 0) -> Pin {
        if #available(iOS 11.0, *) {
            return self.topSafe(to: other, be: relation, constant)
                       .bottomSafe(to: other, be: relation, constant)
        } else {
            // TODO: Add iOS 10 support
            return topBottom(to: other, be: relation, constant)
        }
    }
    
    public func allSafe(to other: UIView? = nil, be relation: Relation = .equal,
                        _ constant: CGFloat = 0) -> Pin {
        if #available(iOS 11.0, *) {
            return self.sidesSafe(to: other, be: relation, constant)
                       .topBottomSafe(to: other, be: relation, constant)
        } else {
            // TODO: Add iOS 10 support
            return all(to: other, be: relation, constant)
        }
    }
}
