import SwiftUI

struct NoInternet: View {
    var body: some View {
        VStack {
            Image(.noInternet)
            Text(Constants.noInternet)
                .font(.bold24)
        }
    }
}

#Preview {
    NoInternet()
}
