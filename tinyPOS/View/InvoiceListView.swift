//
//  InvoiceListView.swift
//  tinyPOS
//
//  Created by nugroho.widodo on 03/02/25.
//

import SwiftUI

struct InvoiceListView: View {

    @State var invoices: [Invoice] = []

    @ViewBuilder
    private func invoiceRow(_ invoice: Invoice) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(verbatim: "Invoice #\(invoice.id)")
                    .font(.headline)
                Spacer()
                Text(invoice.total.currency)
                    .fontWeight(.semibold)
            }

            HStack {
                Text(invoice.invoiceDate.formatted())
                Spacer()
                Text(invoice.status.label)
                    .foregroundColor(invoice.status.color)
            }
            .font(.subheadline)
            .foregroundColor(.secondary)

            if let customer = invoice.customer {
                Text(customer.name)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }

    var body: some View {
        List {
            ForEach(invoices) { invoice in
                NavigationLink(destination: InvoiceDetailView(invoice: invoice)) {
                    invoiceRow(invoice)
                }
            }
        }
        .navigationTitle("Invoices")
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
