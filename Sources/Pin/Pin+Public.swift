//
//  Pin+Public.swift
//  
//
//  Created by Anton Tolstov on 17.07.2020.
//

import UIKit

public extension Pin {
    
    // MARK: - Edges
    
    public func top(to other: UIView? = nil, be relation: Relation = .equal,
                    _ constant: CGFloat = 0) -> Pin {
        addConstraint(to: other, \.topAnchor, with: relation, constant: constant)
    }
    
    public func left(to other: UIView? = nil, be relation: Relation = .equal,
                     _ constant: CGFloat = 0) -> Pin {
        addConstraint(to: other, \.leftAnchor, with: relation, constant: constant)
    }
    
    public func right(to other: UIView? = nil, be relation: Relation = .equal,
                      _ constant: CGFloat = 0) -> Pin {
        addConstraint(to: other, \.rightAnchor, with: relation, constant: -constant)
    }
    
    public func bottom(to other: UIView? = nil, be relation: Relation = .equal,
                       _ constant: CGFloat = 0) -> Pin {
        addConstraint(to: other, \.bottomAnchor, with: relation, constant: -constant)
    }
    
    // MARK: - Convenience shortcuts
    
    public func sides(to other: UIView? = nil, be relation: Relation = .equal,
                      _ constant: CGFloat = 0) -> Pin {
        self.left(to: other, be: relation, constant)
            .right(to: other, be: relation, constant)
    }
    
    public func topBottom(to other: UIView? = nil, be relation: Relation = .equal,
                          _ constant: CGFloat = 0) -> Pin {
        self.top(to: other, be: relation, constant)
            .bottom(to: other, be: relation, constant)
    }
    
    public func all(to other: UIView? = nil, be relation: Relation = .equal,
                    _ constant: CGFloat = 0) -> Pin {
        self.sides(to: other, be: relation, constant)
            .topBottom(to: other, be: relation, constant)
    }
    
    public func all(to other: UIView? = nil, be relation: Relation = .equal,
                    insets: UIEdgeInsets) -> Pin {
        self.top(to: other, be: relation, insets.top)
            .left(to: other, be: relation, insets.left)
            .right(to: other, be: relation, insets.right)
            .bottom(to: other, be: relation, insets.bottom)
    }
    
    // MARK: - Edges relative to other views
    
    public func below(_ other: UIView, be relation: Relation = .equal,
                      _ constant: CGFloat = 0) -> Pin {
        addConstraint(toView: other, from: \.topAnchor,  to: \.bottomAnchor,
                      with: relation, constant: constant)
    }
    
    public func above(_ other: UIView, be relation: Relation = .equal,
                      _ constant: CGFloat = 0) -> Pin {
        addConstraint(toView: other, from: \.bottomAnchor, to: \.topAnchor,
                      with: relation, constant: -constant)
    }
    
    public func before(_ other: UIView, be relation: Relation = .equal,
                       _ constant: CGFloat = 0) -> Pin {
        addConstraint(toView: other, from: \.rightAnchor, to: \.leftAnchor,
                      with: relation, constant: -constant)
    }
    
    public func after(_ other: UIView, be relation: Relation = .equal,
                      _ constant: CGFloat = 0) -> Pin {
        addConstraint(toView: other, from: \.leftAnchor, to: \.rightAnchor,
                      with: relation, constant: constant)
    }
    
    // MARK: - Width, height and size
    
    public func height(be relation: Relation = .equal, _ constant: CGFloat) -> Pin {
        addConstraint(\.heightAnchor, with: relation, constant: constant)
    }
    
    public func width(be relation: Relation = .equal, _ constant: CGFloat) -> Pin {
        addConstraint(\.widthAnchor, with: relation, constant: constant)
    }
    
    public func size(be relation: Relation = .equal, _ constant: CGFloat) -> Pin {
        width(be: relation, constant).height(be: relation, constant)
    }
    
    public func size(be relation: Relation = .equal, _ constant: CGSize) -> Pin {
        width(be: relation, constant.width).height(be: relation, constant.height)
    }
    
    // MARK: - Aspect ratio (width / height)
    
    public func aspectRatio(be relation: Relation = .equal, _ multiplier: CGFloat) -> Pin {
        addConstraint(\.heightAnchor, \.widthAnchor, with: relation, multiplier: multiplier)
    }
    
    // MARK: - Center
    
    public func hCenter(of other: UIView? = nil, be relation: Relation = .equal,
                        _ constant: CGFloat = 0) -> Pin {
        addConstraint(to: other, \.centerXAnchor, with: relation, constant: constant)
    }
    
    public func vCenter(of other: UIView? = nil, be relation: Relation = .equal,
                        _ constant: CGFloat = 0) -> Pin {
        addConstraint(to: other, \.centerYAnchor, with: relation, constant: constant)
    }
    
    public func center(of other: UIView? = nil, be relation: Relation = .equal,
                       _ constant: CGFloat = 0) -> Pin {
        self.hCenter(of: other, be: relation, constant)
            .vCenter(of: other, be: relation, constant)
    }
    
    // MARK: - Existing constraints
    
    public func add(_ constraint: NSLayoutConstraint) -> Pin {
        return Pin(view: view, constraints: constraints.withAppend(constraint),
                   willUnpin: willUnpin)
    }
    
    public func add(_ constraints: [NSLayoutConstraint]) -> Pin {
        return Pin(view: view,
                   constraints: self.constraints.withAppend(contentsOf: constraints),
                   willUnpin: willUnpin)
    }
    
    // MARK: - Remove all existing constraints
    
    public func unpin() -> Pin {
        return Pin(view: view, constraints: constraints, willUnpin: true)
    }
    
    // MARK: - Activation
    
    public var activate: Void {
        guard let view = view else { return }
        
        if willUnpin { removeConstraints() }
        
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
}

