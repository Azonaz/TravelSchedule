import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkModeOn") private var isDarkModeOn: Bool = false

    var body: some View {
        VStack(spacing: 0) {
            Toggle(isOn: $isDarkModeOn) {
                Text(Constants.darkTheme)
            }
            .toggleStyle(SwitchToggleStyle(tint: .blue))
            .frame(height: 60)
            .onChange(of: isDarkModeOn) { newValue in
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                    for window in windowScene.windows {
                        window.overrideUserInterfaceStyle = newValue ? .dark : .light
                    }
                }
            }

            NavigationLink(destination: AgreementView()) {
                HStack {
                    Text(Constants.userAgreement)
                        .font(.regular17)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .imageScale(.large)
                }
                .contentShape(Rectangle())
                .frame(height: 60)
                .padding(.top, 4)
            }
            .buttonStyle(PlainButtonStyle())

            Spacer()

            Text(Constants.infoYandex)
                .font(.regular12)
                .padding()

            Text(Constants.version)
                .font(.regular12)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
    }
}

#Preview {
    SettingsView()
}
