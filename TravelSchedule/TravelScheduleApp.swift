import SwiftUI

@main
struct TravelScheduleApp: App {
    @StateObject var scheduleViewModel = ScheduleViewModel()
    @AppStorage("isDarkModeOn") private var isDarkModeOn: Bool = false

    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(scheduleViewModel)
                .preferredColorScheme(isDarkModeOn ? .dark : .light)
        }
    }
}
