//
//  Payment.swift
//  tinyPOS
//
//  Created by nugroho.widodo on 03/02/25.
//

import Foundation

struct Payment: Identifiable, Codable {
    let id: Int
    let paymentMethod: PaymentMethod
    let amount: Decimal
}
