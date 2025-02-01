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
    var unitPrice: Decimal
    var discount: Decimal

    var subtotal: Decimal {
        return unitPrice * Decimal(quantity)
    }

    var taxAmount: Decimal {
        return product.taxAmount * Decimal(quantity)
    }

    var discountedSubtotal: Decimal {
        return subtotal - discount
    }

    var total: Decimal {
        return discountedSubtotal + taxAmount
    }
}
