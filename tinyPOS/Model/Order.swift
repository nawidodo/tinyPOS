//
//  Order.swift
//  tinyPOS
//
//  Created by nugroho.widodo on 01/02/25.
//

import Foundation

struct Order: Codable, Identifiable {
    let id: Int
    var items: [OrderItem]
    var status: OrderStatus
    var customer: Customer?
    var orderDate: Date
    var paymentMethod: PaymentMethod?

    var subtotal: Decimal {
        items.reduce(0) { $0 + $1.subtotal }
    }

    var taxAmount: Decimal {
        items.reduce(0) { $0 + $1.taxAmount }
    }

    var totalDiscount: Decimal {
        items.reduce(0) { $0 + $1.discount }
    }

    var discountedSubtotal: Decimal {
        items.reduce(0) { $0 + $1.discountedSubtotal }
    }

    var total: Decimal {
        items.reduce(0) { $0 + $1.total }
    }

    enum OrderStatus: String, Codable {
        case pending
        case processing
        case completed
        case cancelled
        case refunded

        var label: String {
            return rawValue.capitalized
        }
    }

    enum PaymentMethod: String, Codable {
        case cash
        case creditCard
        case debitCard
        case digitalWallet
    }
}
