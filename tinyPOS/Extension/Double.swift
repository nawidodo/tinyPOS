//
//  Decimal.swift
//  tinyPOS
//
//  Created by nugroho.widodo on 01/02/25.
//

import Foundation

extension Decimal {
    var currency: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.currencySymbol = "$"
        return formatter.string(from: self as NSDecimalNumber) ?? "$0.00"
    }
}
