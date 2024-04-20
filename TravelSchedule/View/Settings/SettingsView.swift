import SwiftUI

struct SettingsView: View {
    @State private var isDarkModeOn = false

    var body: some View {
        VStack {
            List {
                Toggle(isOn: $isDarkModeOn) {
                    Text(Constants.darkTheme)
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
                    Text(Constants.userAgreement)
                        .font(.regular17)
                        .padding(.vertical, 10)
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            }
            .listStyle(.inset)
            Spacer()

            Text(Constants.infoYandex)
                .font(.regular12)
                .padding()

            Text(Constants.version)
                .font(.regular12)
        }
        .padding()
    }
}

#Preview {
    SettingsView()
}
