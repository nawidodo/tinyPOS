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
    var discount: Discount?
    var invoices: [Invoice] = []
    var pax = 1

    var taxAmount: Decimal {
        items.reduce(0) { $0 + $1.taxAmount }
    }

    var totalExcludingTax: Decimal {
        items.reduce(0) { $0 + $1.subtotalExcludingTax }
    }

    var totalIncludingTax: Decimal {
        items.reduce(0) { $0 + $1.subtotalIncludingTax }
    }

    var total: Decimal {
        totalIncludingTax - discountAmount
    }

    var discountAmount: Decimal {
        guard let discount else { return 0 }
        switch discount.type {
        case .percentage:
            return totalIncludingTax * discount.value
        case .amount:
            return discount.value
        }
    }
    
    enum OrderStatus: String, Codable {
        case processing
        case completed
        case cancelled

        var label: String {
            return rawValue.capitalized
        }
    }
}
