//
//  OrderItem.swift
//  tinyPOS
//
//  Created by nugroho.widodo on 01/02/25.
//

import Foundation

struct OrderItem: Codable, Identifiable {
    let id: Int
    let product: Product
    var quantity: Int

    var subtotalExcludingTax: Decimal {
        return product.priceExcludingTax * Decimal(quantity)
    }

    var subtotalIncludingTax: Decimal {
        return product.priceIncludingTax * Decimal(quantity)
    }

    var taxAmount: Decimal {
        return product.taxAmount * Decimal(quantity)
    }
}
