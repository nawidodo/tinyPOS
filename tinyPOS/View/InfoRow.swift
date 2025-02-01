//
//  InfoRow.swift
//  tinyPOS
//
//  Created by nugroho.widodo on 01/02/25.
//

import SwiftUI

struct InfoRow: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.secondary)
            Spacer()
            Text(value)
        }
    }
}

#Preview {
    InfoRow(title: "Price", value: "$26.06")
}
