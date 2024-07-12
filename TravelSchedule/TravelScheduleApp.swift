import SwiftUI

@main
struct TravelScheduleApp: App {
    @StateObject var scheduleViewModel = ScheduleViewModel()

    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(scheduleViewModel)
        }
    }
}
