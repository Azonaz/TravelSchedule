import SwiftUI

struct CloseButton: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(.closeButton)
        })
    }
}

#Preview {
    CloseButton()
}
