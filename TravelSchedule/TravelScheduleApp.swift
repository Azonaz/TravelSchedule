import SwiftUI

@main
struct TravelScheduleApp: App {
    @StateObject var viewModel = ScheduleViewModel()

    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(viewModel)
        }
    }
}
