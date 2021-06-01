//
//  NSDate+Base.swift
//  Payoneer
//
//  Created by Collins Korir on 22/05/2021.
//

import Foundation

extension DateFormatter {
    static var sharedDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, MMM d, h:mm a"
        dateFormatter.locale = Locale(identifier: "en_US")
        return dateFormatter
    }()
}
