import SwiftUI

enum ErrorType {
    case noInternet
    case serverUnavailable
}

struct ErrorInfo {
    let image: ImageResource
    let title: String
}

struct ErrorView: View {
    let errorType: ErrorType

    var body: some View {
        let info: ErrorInfo
        switch errorType {
        case .noInternet:
            info = ErrorInfo(image: .noInternet, title: Constants.noInternet)
        case .serverUnavailable:
            info = ErrorInfo(image: .serverError, title: Constants.serverError)
        }

        return VStack {
            Image(info.image)
            Text(info.title)
                .font(.bold24)
        }
    }
}

#Preview {
    ErrorView(errorType: .noInternet)
}
