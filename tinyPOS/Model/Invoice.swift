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
    var payments: [Payment] = []

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

    var totalBeforeSplit: Decimal {
        totalAfterDiscount + surcharge + unpaidCustomerBalance
    }

    var total: Decimal {
        switch splitBill {
        case .individual:
            return totalBeforeSplit
        case .equal:
            return totalBeforeSplit / Decimal(pax)
        case .none:
            return totalBeforeSplit
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

    var unpaidCustomerBalance: Decimal {
        guard let customer else { return 0 }
        return customer.balance
    }

    var paid: Decimal {
        payments.reduce(0) { $0 + $1.amount }
    }

    var returned: Decimal {
        0
    }

    var remaining: Decimal {
        total - paid - returned
    }

     enum InvoiceStatus: String, Codable {
         case unpaid
         case partial
         case paid
         case cancelled
         case refunded

         var label: String {
             return rawValue.capitalized
         }
     }
}
