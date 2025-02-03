//
//  tinyPOSApp.swift
//  tinyPOS
//
//  Created by nugroho.widodo on 01/02/25.
//

import SwiftUI

@main
struct tinyPOSApp: App {
    var body: some Scene {
        WindowGroup {
            OrderListView(orders: Bundle.main.decode([Order].self, from: "Orders.json"))
        }
    }
}
