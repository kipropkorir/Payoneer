//
//  UIViewController.swift
//  Payoneer
//
//  Created by Collins Korir on 22/05/2021.
//

import UIKit

extension UIViewController {
    //MARK:- Static properties
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
