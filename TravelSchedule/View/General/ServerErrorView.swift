import SwiftUI

struct ServerErrorView: View {
    var body: some View {
        VStack {
            Image(.serverError)
            Text("Ошибка сервера")
                .font(.bold24)
        }
    }
}

#Preview {
    ServerErrorView()
}
