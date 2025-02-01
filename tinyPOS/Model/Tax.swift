//
//  Tax.swift
//  tinyPOS
//
//  Created by nugroho.widodo on 01/02/25.
//

import Foundation

struct Tax: Codable, Identifiable {
    let id: Int
    var name: String
    var rate: Decimal // Example: 0.1 for 10% tax
}
