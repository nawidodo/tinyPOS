//
//  Order.swift
//  tinyPOS
//
//  Created by nugroho.widodo on 02/02/25.
//

import SwiftUI

extension Order.OrderStatus {
    var color: Color {
        switch self {
        case .processing:
            return .blue
        case .completed:
            return .green
        case .cancelled:
            return .red
        }
    }
}

extension Order {
    static var sampleOrders: [Order] {
        let tax = Tax(id: 1, name: "GST", rate: 0.1)

        let products = [
            Product(id: 1, name: "Big Brekkie", priceIncludingTax: 16.00, tax: tax),
            Product(id: 2, name: "Bruchetta", priceIncludingTax: 8.00, tax: tax),
            Product(id: 3, name: "Poached Eggs", priceIncludingTax: 12.00, tax: tax),
            Product(id: 4, name: "Coffee", priceIncludingTax: 5.00, tax: tax),
            Product(id: 5, name: "Tea", priceIncludingTax: 3.00, tax: tax),
            Product(id: 6, name: "Soda", priceIncludingTax: 4.00, tax: tax)
        ]

        let orderItems1 = [
            OrderItem(id: 1, product: products[0], quantity: 2),  // 2x Big Brekkie
            OrderItem(id: 2, product: products[1], quantity: 1),  // 1x Bruchetta
            OrderItem(id: 3, product: products[2], quantity: 1),  // 1x Poached Eggs
            OrderItem(id: 4, product: products[3], quantity: 1),  // 1x Coffee
            OrderItem(id: 5, product: products[4], quantity: 1),  // 1x Tea
            OrderItem(id: 6, product: products[5], quantity: 1)   // 1x Soda
        ]

        let orderItems2 = [
              OrderItem(id: 1, product: products[4], quantity: 1),  // 1x Tea ($3)
              OrderItem(id: 2, product: products[3], quantity: 3),  // 3x Coffee ($9)
              OrderItem(id: 3, product: products[5], quantity: 1),  // 1x Soda ($4)
              OrderItem(id: 4, product: products[0], quantity: 3),  // 3x Big Brekkie ($48)
              OrderItem(id: 5, product: products[1], quantity: 1),  // 1x Poached Eggs ($12)
              OrderItem(id: 6, product: products[2], quantity: 1)   // 1x Garden Salad ($10)
        ]

        let orderItems = [
            OrderItem(id: 1, product: products[5], quantity: 2),  // 2x Tea ($6)
            OrderItem(id: 2, product: products[4], quantity: 3),  // 3x Coffee ($9)
            OrderItem(id: 3, product: products[6], quantity: 2),  // 2x Soda ($8)
            OrderItem(id: 4, product: products[1], quantity: 5),  // 5x Bruchetta ($40)
            OrderItem(id: 5, product: products[0], quantity: 5),  // 5x Big Brekkie ($80)
            OrderItem(id: 6, product: products[2], quantity: 2),  // 2x Poached Eggs ($24)
            OrderItem(id: 7, product: products[3], quantity: 3)   // 3x Garden Salad ($30)
        ]

        return [
            Order(
                        id: 1001,
                        items: orderItems1,
                        status: .completed,
                        customer: Customer(id: 1, name: "Group 1", balance: 0),
                        orderDate: Date(),
                        discount: nil,
                        invoices: Invoice.sampleInvoices),
            Order(
                        id: 1002,
                        items: orderItems2,
                        status: .completed,
                        customer: Customer(id: 2, name: "Group 2", balance: 0),
                        orderDate: Date(),
                        discount: Discount(id: 0, value: 0.1, type: .percentage)
                    ),
            Order(
                        id: 1003,
                        items: orderItems,
                        status: .completed,
                        customer: Customer(id: 3, name: "Group 3", balance: 0),
                        orderDate: Date().addingTimeInterval(3600), // 1 hour after Group 2
                        discount: Discount(id: 1, value: 25, type: .amount)
                    )
        ]
    }
}

