import SwiftUI
import WebKit

struct AgreementView: View {
    let agreementLink = "https://yandex.ru/legal/practicum_offer"

    var body: some View {
        if let url = URL(string: agreementLink) {
            WebView(url: url)
                .navigationBarTitle("Пользовательское соглашение", displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: BackButton())
                .foregroundColor(.black)
                .edgesIgnoringSafeArea(.all)
        } else {
            Text("Невозможно загрузить пользовательское соглашение.")
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
