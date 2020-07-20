//
//  UIView+.swift
//  
//
//  Created by Anton Tolstov on 20.07.2020.
//

import UIKit

public extension UIView {
    public var pin: Pin {
        return Pin(view: self)
    }
}

