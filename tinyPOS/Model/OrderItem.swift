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
    var notes: String?

    var subtotal: Decimal {
        return unitPrice * Decimal(quantity)
    }

    var total: Decimal {
        return subtotal - discount
    }
}
