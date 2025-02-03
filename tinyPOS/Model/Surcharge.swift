//
//  Surcharge.swift
//  tinyPOS
//
//  Created by nugroho.widodo on 03/02/25.
//

import Foundation

struct Surcharge: Identifiable, Codable {
    var id: Int
    var paymentMethod: PaymentMethod
    var rate: Decimal
}
