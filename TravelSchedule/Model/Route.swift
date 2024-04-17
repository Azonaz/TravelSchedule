import Foundation

struct Route: Identifiable {
    let id = UUID()
    let carrierLogo: String
    let carrierName: String
    let transferCity: String
    let dateString: String
    let startTime: String
    let finishTime: String
    let travelDuration: String
}
