import Foundation

enum PaymentMethod: String, Codable {
    case cash
    case debit
    case credit
    case wallet

    var label: String {
        self.rawValue.capitalized
    }
}
