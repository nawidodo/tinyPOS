//
//  Invoice+Extensions.swift
//  tinyPOS
//
//  Created by nugroho.widodo on 03/02/25.
//

import SwiftUI

extension Invoice {
    static var sampleInvoices: [Invoice] {
        let tax = Tax(id: 1, name: "GST", rate: 0.1)
        let orderID = 1001

        let products = [
            Product(id: 1, name: "Big Brekkie", priceIncludingTax: 16.00, tax: tax),
            Product(id: 2, name: "Bruchetta", priceIncludingTax: 8.00, tax: tax),
            Product(id: 3, name: "Poached Eggs", priceIncludingTax: 12.00, tax: tax),
            Product(id: 4, name: "Coffee", priceIncludingTax: 5.00, tax: tax),
            Product(id: 5, name: "Tea", priceIncludingTax: 3.00, tax: tax),
            Product(id: 6, name: "Soda", priceIncludingTax: 4.00, tax: tax)
        ]

        // Person #1 items (Big Brekkie + Tea = $19)
        let items1 = [
            InvoiceItem(id: 1, product: products[0], quantity: 1),
            InvoiceItem(id: 2, product: products[4], quantity: 1)
        ]

        // Person #2 items (Big Brekkie + Coffee = $21)
        let items2 = [
            InvoiceItem(id: 1, product: products[0], quantity: 1),
            InvoiceItem(id: 2, product: products[3], quantity: 1)
        ]

        // Person #3 items (Bruchetta + Poached Eggs + Soda = $24)
        let items3 = [
            InvoiceItem(id: 1, product: products[1], quantity: 1),
            InvoiceItem(id: 2, product: products[2], quantity: 1),
            InvoiceItem(id: 3, product: products[5], quantity: 1)
        ]

        return [
            Invoice(
                id: 1001,
                orderID: orderID,
                items: items1,
                status: .unpaid,
                customer: Customer(id: 1, name: "Person #1", balance: 0),
                invoiceDate: Date(),
                discount: nil,
                paymentMethod: .cash,
                pax: 1,
                splitBill: .individual
            ),
            Invoice(
                id: 1002,
                orderID: orderID,
                items: items2,
                status: .unpaid,
                customer: Customer(id: 2, name: "Person #2", balance: 0),
                invoiceDate: Date(),
                discount: nil,
                paymentMethod: .cash,
                pax: 1,
                splitBill: .individual
            ),
            Invoice(
                id: 1003,
                orderID: orderID,
                items: items3,
                status: .unpaid,
                customer: Customer(id: 3, name: "Person #3", balance: 0),
                invoiceDate: Date(),
                discount: nil,
                paymentMethod: .cash,
                pax: 1,
                splitBill: .individual
            )
        ]
    }
}

extension Invoice.InvoiceStatus {
    var color: Color {
        switch self {
        case .unpaid:
            return .orange
        case .partiallyPaid:
            return .blue
        case .paid:
            return .green
        case .cancelled:
            return .red
        case .refunded:
            return .purple
        }
    }
}
