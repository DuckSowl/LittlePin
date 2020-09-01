//
//  UIView+.swift
//  
//
//  Created by Anton Tolstov on 20.07.2020.
//

import UIKit

public extension UIView {
    public var pin: Pin {  Pin(view: self) }
    public var unpin: Pin { pin.unpin() }
    
    public func pin(super superView: UIView) -> Pin {
        if !self.isDescendant(of: superView) {
            superView.addSubview(self)
        }
        
        return self.pin
    }
}

