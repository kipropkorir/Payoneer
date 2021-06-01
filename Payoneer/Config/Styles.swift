//
//  Styles.swift
//  Payoneer
//
//  Created by Collins Korir on 22/05/2021.
//

import UIKit

extension UIColor {
    enum Payoneer {
        static let base: UIColor = UIColor(red: 0.31, green: 0.72, blue: 0.83, alpha: 1.0)
        static let lightBackgroundColor: UIColor = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 1.0)
    }
}

extension UIFont {
    enum Payoneer {
        static let lightRegular: UIFont = .systemFont(ofSize: 17.0, weight: .light)
        static let lightSmall: UIFont = .systemFont(ofSize: 15.0, weight: .light)
        static let heavyLarge: UIFont = .systemFont(ofSize: 20.0, weight: .heavy)
    }
}
