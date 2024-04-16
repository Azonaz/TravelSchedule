import SwiftUI
import WebKit

struct AgreementView: View {
    @ObservedObject var viewModel = SettingsViewModel()
    let agreementLink = "https://yandex.ru/legal/practicum_offer"

    var body: some View {
        ZStack {
            Color.whiteDay.edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                HStack {
                    BackButton()
                    Text("Пользовательское соглашение")
                        .foregroundColor(.blackDay)
                        .font(.bold17)
                        .lineLimit(1)
                        .padding(.leading, 24)
                    Spacer()
                }
                .padding(.horizontal, 8)
                .padding([.top, .bottom], 8)
                if viewModel.isInternetAvailable {
                    if let url = URL(string: agreementLink) {
                        WebView(url: url)
                            .foregroundColor(.primary)
                            .edgesIgnoringSafeArea(.all)
                    } else {
                        NoInternet()
                    }
                } else {
                    Spacer()
                    NoInternet()
                    Spacer()
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            viewModel.monitorInternetConnection()
        }
    }
}

struct WebView: UIViewRepresentable {
    var url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

#Preview {
    AgreementView()
}
