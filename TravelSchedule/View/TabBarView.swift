import SwiftUI

struct TabBarView: View {
    var body: some View {
        NavigationStack {
            TabView {
                VStack {
                    ContentView()
                    Spacer()
                    Divider()
                }
                .tabItem {
                    Image(.schedule)
                }
                .padding(.bottom, 10)

                VStack {
                    SettingsView()
                    Spacer()
                    Divider()
                }
                .tabItem {
                    Image(.settings)
                }
                .padding(.bottom, 10)
            }
            .accentColor(.primary)
        }
    }
}

#Preview {
    TabBarView()
        .environmentObject(ScheduleViewModel())
}
