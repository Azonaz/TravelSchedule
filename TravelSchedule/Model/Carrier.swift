import Foundation

struct Carrier: Identifiable {
    let id = UUID()
    let carrierLogo: String
    let carrierName: String
    let email: String
    let phone: String
}
