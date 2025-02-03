//
//  InvoiceDetailView.swift
//  tinyPOS
//
//  Created by nugroho.widodo on 03/02/25.
//

import SwiftUI

struct InvoiceDetailView: View {
    @State var invoice: Invoice

    @ViewBuilder
    var header: some View {
        Section(header: Text("Invoice Information")) {
            InfoRow(title: "Invoice Number", value: "\(invoice.id)")
            InfoRow(title: "Order Number", value: "\(invoice.orderID)")
            InfoRow(title: "Date", value: invoice.invoiceDate.formatted())
            InfoRow(title: "Payment Method", value: invoice.paymentMethod.label)
            if invoice.splitBill != .none {
                InfoRow(title: "Split Bill", value: invoice.splitBill.label)
            }
            InfoRow(title: "Status", value: invoice.status.label)
            if let customer = invoice.customer {
                InfoRow(title: "Customer", value: customer.name)
            }
        }
    }

    @ViewBuilder
    var discount: some View {
        if let discount = invoice.discount, discount.value > 0 {
            switch discount.type {
            case .amount:
                InfoRow(title: "Discount", value: "-\(invoice.discountAmount.currency)")
            case .percentage:
                InfoRow(title: "Discount", value: "\(discount.value*100)% (-\(invoice.discountAmount.currency))")
            }
        }
    }

    @ViewBuilder
    var surcharge: some View {
        if invoice.surcharge > 0 {
            InfoRow(title: "Surcharge", value: "\(invoice.paymentMethod.surchargeRate*100)% (\(invoice.surcharge.currency))")
        }
    }

    @ViewBuilder
    var total: some View {
        Section(header: Text("Summary")) {
            InfoRow(title: "Item Total", value: invoice.totalExcludingTax.currency)
            InfoRow(title: "Tax", value: invoice.taxAmount.currency)
            InfoRow(title: "Subtotal", value: invoice.totalIncludingTax.currency)
            discount
            surcharge
            InfoRow(title: "Total", value: invoice.total.currency)
            if invoice.splitBill == .equal {
                InfoRow(title: "Split Count", value: invoice.pax.formatted(.number))
                InfoRow(title: "Grand Total After Split", value: invoice.totalAfterSplit.currency)
            }
        }
    }

    @ViewBuilder
    var items: some View {
        Section(header: Text("Items")) {
            ForEach(invoice.items) { item in
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(item.quantity) x \(item.product.name) @ \(item.product.priceIncludingTax.currency) (\(item.subtotalIncludingTax.currency))")
                        .font(.subheadline)
                }
            }
        }
    }

    var body: some View {
        List {
            header
            items
            total
        }
    }
}



struct InvoiceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        InvoiceDetailView(invoice: Invoice.sampleInvoices[0])
    }
}


