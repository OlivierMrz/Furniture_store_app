//
//  UIColor.swift
//  Furniture_store
//
//  Created by Olivier Miserez on 11/06/2021.
//

import UIKit

extension UIColor {
    static let blue_primary = UIColor(named: "Primary")!
    static let blue_secondary = UIColor(named: "Secondary")!
    static let black_primary = UIColor(named: "Black")!
    static let background_primary = UIColor(named: "Background_primary")!
    static let background_secondary = UIColor(named: "Background_secondary")!
    static let button_background = UIColor(named: "Secondary_button")!

    static let buttonGradient: [CGColor] = [blue_primary.cgColor, blue_secondary.cgColor]
}
