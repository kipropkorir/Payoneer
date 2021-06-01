//
//  NSString+Localization.swift
//  Payoneer
//
//  Created by Collins Korir on 22/05/2021.
//

import Foundation

extension String {
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }

    public func localized(parameter: Int) -> String {
        let formatString = localized
        let resultString = String.localizedStringWithFormat(formatString, parameter)
        return resultString
    }

    public func localized(parameter: String) -> String {
        let formatString = localized
        let resultString = String.localizedStringWithFormat(formatString, parameter)
        return resultString
    }

    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
