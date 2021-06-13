//
//  ReuseIdentifying.swift
//  Furniture_store
//
//  Created by Olivier Miserez on 13/06/2021.
//

import Foundation

protocol ReuseIdentifying {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifying {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
