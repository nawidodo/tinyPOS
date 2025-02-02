//
//  OrderDetailView.swift
//  tinyPOS
//
//  Created by nugroho.widodo on 01/02/25.
//

import SwiftUI

struct OrderDetailView: View {
    @State var order: Order

    @ViewBuilder
    var header: some View {
        Section(header: Text("Order Information")) {
            InfoRow(title: "Order Number", value: "\(order.id)")
            InfoRow(title: "Date", value: order.orderDate.formatted())
            InfoRow(title: "Status", value: order.status.label)
            if let customer = order.customer {
                InfoRow(title: "Customer", value: customer.name)
            }
        }
    }

    @ViewBuilder
    var discount: some View {
        if let discount = order.discount, discount.value > 0 {
            switch discount.type {
            case .amount:
                InfoRow(title: "Discount", value: "-\(order.discountAmount.currency)")
            case .percentage:
                InfoRow(title: "Discount", value: "\(discount.value*100)% (-\(order.discountAmount.currency))")
            }
        }
    }

    @ViewBuilder
    var total: some View {
        Section(header: Text("Summary")) {
            InfoRow(title: "Item Total", value: order.totalExcludingTax.currency)
            InfoRow(title: "Tax", value: order.taxAmount.currency)
            InfoRow(title: "Subtotal", value: order.totalIncludingTax.currency)
            discount
            InfoRow(title: "Total", value: order.total.currency)
        }

    }

    @ViewBuilder
    var items: some View {
        Section(header: Text("Items")) {
            ForEach(order.items) { item in
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



struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailView(order: Order.sampleOrders[0])
    }
}
