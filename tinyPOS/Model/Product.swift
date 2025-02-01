//
//  Product.swift
//  tinyPOS
//
//  Created by nugroho.widodo on 01/02/25.
//

import Foundation

struct Product: Codable, Identifiable {
    let id: Int
    var name: String
    var priceIncludingTax: Decimal // This is the display price that includes tax
    var tax: Tax

    var priceExcludingTax: Decimal {
        return priceIncludingTax / (1 + tax.rate)
    }

    var taxAmount: Decimal {
        return priceIncludingTax - priceExcludingTax
    }
}
