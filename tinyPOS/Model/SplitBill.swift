//
//  SplitBill.swift
//  tinyPOS
//
//  Created by nugroho.widodo on 03/02/25.
//

enum SplitBill: String, Codable {
    case individual
    case equal
    case none

    var label: String {
        return self.rawValue.capitalized
    }
}
