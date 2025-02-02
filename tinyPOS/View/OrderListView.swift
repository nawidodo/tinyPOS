import SwiftUI

struct OrderListView: View {

    @State var orders: [Order] = []
    
    @ViewBuilder
    private func orderRow(_ order: Order) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(verbatim: "Order #\(order.id)")
                    .font(.headline)
                Spacer()
                Text(order.total.currency)
                    .fontWeight(.semibold)
            }
            
            HStack {
                Text(order.orderDate.formatted())
                Spacer()
                Text(order.status.label)
                    .foregroundColor(order.status.color)
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
            
            if let customer = order.customer {
                Text(customer.name)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(orders) { order in
                    NavigationLink(destination: OrderDetailView(order: order)) {
                        orderRow(order)
                    }
                }
            }
            .navigationTitle("Orders")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Add new order action
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OrderListView(orders: Order.sampleOrders)
        }
    }
}
