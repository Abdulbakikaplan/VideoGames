//
//  Double+Ext.swift
//  VideoGames
//
//  Created by Abdülbaki Kaplan on 16.01.2021.
//

import Foundation

extension Formatter {
    class func currencyFormatter() -> NumberFormatter {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.alwaysShowsDecimalSeparator = true
            formatter.minimumFractionDigits = 1
            formatter.groupingSeparator = "."
            formatter.decimalSeparator = ","
            return formatter
        }
}

extension Double {
    var double: String {
        return (NumberFormatter.currencyFormatter().string(from: NSNumber(value: self)) ?? "")
    }
}
