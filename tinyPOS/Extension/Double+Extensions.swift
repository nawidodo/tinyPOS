//
//  Decimal.swift
//  tinyPOS
//
//  Created by nugroho.widodo on 01/02/25.
//

import Foundation

extension Decimal {
    var currency: String {
        self.formatted(.currency(code: "USD"))
    }
}
