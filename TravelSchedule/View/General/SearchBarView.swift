import SwiftUI

struct SearchBarView: View {
    @State private var searchText = ""

    var body: some View {
        VStack {
            TextField("Введите запрос", text: $searchText)
                .padding(.leading, 30)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.lightGrayDay)
                        .overlay(
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.grayUniversal)
                                    .padding(.leading, 10)
                                Spacer()
                            }
                        )
                )
                .padding(.horizontal)
            Spacer()
        }
    }
}

#Preview {
    SearchBarView()
}
