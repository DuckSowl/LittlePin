//
//  Array+.swift
//
//
//  Created by Anton Tolstov on 20.07.2020.
//

import Foundation

extension Array {
    func withAppend<S>(contentsOf newElements: S) -> Array where Element == S.Element, S : Sequence {
        return self + newElements
    }
    
    func withAppend(_ newElement: Element) -> Array {
        return self + [newElement]
    }
}
