//
//  Customer.swift
//  tinyPOS
//
//  Created by nugroho.widodo on 01/02/25.
//

import Foundation

struct Customer: Codable, Identifiable {
    let id: Int
    var name: String
    var balance: Decimal
}
