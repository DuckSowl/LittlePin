//
//  Array+.swift
//
//
//  Created by Anton Tolstov on 20.07.2020.
//

import Foundation

extension Array {
    func withAppend(_ elements: [Element?]) -> Array {
        return self + elements.compactMap { $0 }
    }
    
    func withAppend(_ elements: Element?...) -> Array {
        withAppend(elements)
    }
}
