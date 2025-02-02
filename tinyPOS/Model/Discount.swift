//
//  Discount.swift
//  tinyPOS
//
//  Created by nugroho.widodo on 01/02/25.
//

import Foundation

struct Discount: Codable, Identifiable {
    let id: Int
    var value: Decimal
    var type: DiscountType

    enum DiscountType: String, Codable {
        case percentage
        case amount
    }
}
