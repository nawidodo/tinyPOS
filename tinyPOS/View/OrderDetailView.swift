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
                InfoRow(title: "Discount", value: "-\(discount.value.currency)")
            case .percentage:
                InfoRow(title: "Discount", value: "\(discount.value*100)%")
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
        OrderDetailView(order: OrderDetailView_Previews.dummyOrder)
    }

    static var dummyOrder: Order {

        let tax = Tax(id: 0, name: "10%", rate: 0.1)

        let products = [
            Product(id: 1, name: "Espresso", priceIncludingTax: 3.50, tax: tax),
            Product(id: 2, name: "Cappuccino", priceIncludingTax: 4.50, tax: tax),
            Product(id: 3, name: "Croissant", priceIncludingTax: 2.75, tax: tax)
        ]
        
        let orderItems = [
            OrderItem(id: 1, product: products[0], quantity: 2),
            OrderItem(id: 2, product: products[1], quantity: 1),
            OrderItem(id: 3, product: products[2], quantity: 3)
        ]
        
        return Order(
            id: 1001,
            items: orderItems,
            status: .completed,
            customer: Customer(id: 1, name: "Hibiki", balance: 50.00),
            orderDate: Date(),
            discount: Discount(id: 0, value: 10, type: .amount)
        )
    }
}
