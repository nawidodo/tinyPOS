import Foundation

enum PaymentMethod: String, Codable {
    case cash
    case debit
    case credit
    case wallet
    
    var surchargeRate: Decimal {
        switch self {
        case .cash:
            return 0
        case .debit:
            return 0.005
        case .credit:
            return 0.012
        case .wallet:
            return 0.001
        }
    }
}
