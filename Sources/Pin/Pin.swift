//
//  Pin.swift
//
//
//  Created by Anton Tolstov on 17.07.2020.
//

import UIKit

public struct Pin {
    
    // MARK: - Properties
    
    weak var view: UIView?
    
    var willUnpin: Bool = false
    
    public private(set) var constraints = [NSLayoutConstraint]()
    
    // MARK: - Initializers
    
    public init(view: UIView) {
        self.view = view
    }
    
    init(view: UIView?, constraints: [NSLayoutConstraint],
         willUnpin: Bool) {
        self.view = view
        self.constraints = constraints
        self.willUnpin = willUnpin
    }
    
    // MARK: - Constraint appending functions
            
    func addConstraint<Axis, Anchor> (to otherView: UIView?,
                                      _ path: KeyPath<UIView, Anchor>,
                                      with relation: Relation,
                                      constant: CGFloat)
        -> Pin where Anchor: NSLayoutAnchor<Axis> {
            return addConstraint(toView: otherView, from: path, to: path,
                                 with: relation, constant: constant)
    }
    
    func addConstraint<Axis, Anchor> (toView otherView: UIView?,
                                      from: KeyPath<UIView, Anchor>,
                                      to: KeyPath<UIView, Anchor>,
                                      with relation: Relation,
                                      constant: CGFloat)
        -> Pin where Anchor: NSLayoutAnchor<Axis> {
            guard let view = view, let otherView = otherView ?? view.superview else { return self }
            
            switch relation {
            case .equal:
                return add(view[keyPath: from]
                    .constraint(equalTo: otherView[keyPath: to], constant: constant))
            case .less:
                return add(view[keyPath: from]
                    .constraint(lessThanOrEqualTo: otherView[keyPath: to], constant: -constant))
            case .greater:
                return add(view[keyPath: from]
                    .constraint(greaterThanOrEqualTo: otherView[keyPath: to], constant: constant))
            }
    }
    
    func addConstraint<D: NSLayoutDimension>(_ path: KeyPath<UIView, D>,
                                             with relation: Relation,
                                             constant: CGFloat) -> Pin {
        guard let view = view else { return self }
        
        switch relation {
        case .equal:
            return add(view[keyPath: path].constraint(equalToConstant: constant))
        case .less:
            return add(view[keyPath: path].constraint(lessThanOrEqualToConstant: constant))
        case .greater:
            return add(view[keyPath: path].constraint(greaterThanOrEqualToConstant: constant))
        }
    }
    
    func addConstraint<D: NSLayoutDimension>(_ from: KeyPath<UIView, D>,
                                             _ to: KeyPath<UIView, D>,
                                             with relation: Relation,
                                             multiplier: CGFloat) -> Pin {
        guard let view = view else { return self }
        
        switch relation {
        case .equal:
            return add(view[keyPath: from].constraint(equalTo: view[keyPath: to],
                                                      multiplier: multiplier))
        case .less:
            return add(view[keyPath: from].constraint(lessThanOrEqualTo: view[keyPath: to],
                                                      multiplier: multiplier))
        case .greater:
            return add(view[keyPath: from].constraint(greaterThanOrEqualTo: view[keyPath: to],
                                                      multiplier: multiplier))
        }
    }
    
    func removeConstraints() {
        var viewChain: UIView? = view
        while let ancestorView = viewChain {
            ancestorView.removeConstraints(ancestorView.constraints.filter {
                return $0.firstItem as? UIView == view || $0.secondItem as? UIView == view
            })
            viewChain = viewChain?.superview
        }
    }
    
    // MARK: - Relation Enum
    
    public enum Relation {
        case equal
        case less
        case greater
    }
}
