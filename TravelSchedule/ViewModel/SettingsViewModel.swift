import Foundation
import Network

final class SettingsViewModel: ObservableObject {
    @Published var isInternetAvailable = true
    private var monitor: NWPathMonitor?

    init() {
        monitorInternetConnection()
    }

    func monitorInternetConnection() {
        monitor = NWPathMonitor()
        monitor?.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isInternetAvailable = (path.status == .satisfied)
            }
        }
        let queue = DispatchQueue(label: "Monitor")
        monitor?.start(queue: queue)
    }

    deinit {
        monitor?.cancel()
    }
}
