import SwiftUI

struct NoInternet: View {
    var body: some View {
        VStack {
            Image(.noInternet)
            Text("Нет интернета")
                .font(.bold24)
        }
    }
}

#Preview {
    NoInternet()
}
