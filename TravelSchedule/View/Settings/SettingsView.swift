import SwiftUI

struct SettingsView: View {
    @State private var isDarkModeOn = false

    var body: some View {
        VStack {
            List {
                Toggle(isOn: $isDarkModeOn) {
                    Text("Темная тема")
                }
                .toggleStyle(SwitchToggleStyle(tint: .blue))
                .listRowSeparator(.hidden)
                .padding(.top, 30)
                .onChange(of: isDarkModeOn) { newValue in
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                        for window in windowScene.windows {
                            window.overrideUserInterfaceStyle = newValue ? .dark : .light
                        }
                    }
                }

                NavigationLink(destination: AgreementView()) {
                    Text("Пользовательское соглашение")
                        .font(.regular17)
                        .padding(.vertical, 10)
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            }
            .listStyle(.inset)
            Spacer()

            Text("Приложение использует API «Яндекс.Расписания»")
                .font(.regular12)
                .padding()

            Text("Версия 1.0 (beta)")
                .font(.regular12)
        }
        .padding()
    }
}

#Preview {
    SettingsView()
}
