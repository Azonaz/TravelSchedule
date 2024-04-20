import SwiftUI

struct ServerErrorView: View {
    var body: some View {
        VStack {
            Image(.serverError)
            Text(Constants.serverError)
                .font(.bold24)
        }
    }
}

#Preview {
    ServerErrorView()
}
