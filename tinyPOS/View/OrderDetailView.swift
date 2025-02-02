//
//  OrderDetailView.swift
//  tinyPOS
//
//  Created by nugroho.widodo on 01/02/25.
//

import SwiftUI

struct OrderDetailView: View {
    @State var order: Order
    var body: some View {
        List {
            Section(header: Text("Order Information")) {
                InfoRow(title: "Order Number", value: "\(order.id)")
                InfoRow(title: "Date", value: order.orderDate.formatted())
                InfoRow(title: "Status", value: order.status.label)
                if let customer = order.customer {
                    InfoRow(title: "Customer", value: customer.name)
                }
            }
        }
    }
}



struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailView(order: OrderDetailView_Previews.dummyOrder)
    }

    static var dummyOrder: Order {
        Order(id: 0, items: [], status: .completed, customer: Customer(id: 0, name: "Hibiki", balance: 0), orderDate: Date(), discount: <#Decimal#>)
    }
}
