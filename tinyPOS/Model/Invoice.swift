//
//  Invoice.swift
//  tinyPOS
//
//  Created by nugroho.widodo on 01/02/25.
//

import Foundation

struct Invoice: Codable, Identifiable {
    let id: Int
    let orderID: Int
    var items: [InvoiceItem]
    var status: InvoiceStatus
    var customer: Customer?
    var invoiceDate: Date
    var discount: Discount?
    var paymentMethod: PaymentMethod
    var pax = 1
    var splitBill: SplitBill = .none

    var taxAmount: Decimal {
        items.reduce(0) { $0 + $1.taxAmount }
    }

    var totalExcludingTax: Decimal {
        items.reduce(0) { $0 + $1.subtotalExcludingTax }
    }

    var totalIncludingTax: Decimal {
        items.reduce(0) { $0 + $1.subtotalIncludingTax }
    }

    var totalAfterDiscount: Decimal {
        totalIncludingTax - discountAmount
    }

    var total: Decimal {
        totalAfterDiscount + surcharge
    }

    var totalAfterSplit: Decimal {
        switch splitBill {
        case .individual:
            return total
        case .equal:
            return total / Decimal(pax)
        case .none:
            return total
        }
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

    var surcharge: Decimal {
        return paymentMethod.surchargeRate * totalAfterDiscount
    }
    
     enum InvoiceStatus: String, Codable {
         case pending
         case partiallyPaid
         case paid
         case cancelled
         case refunded

         var label: String {
             return rawValue.capitalized
         }
     }
}
