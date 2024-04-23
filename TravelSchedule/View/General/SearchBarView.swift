import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            TextField(Constants.enterRequest, text: $searchText)
                .padding(.leading, 30)
                .padding(.vertical, 10)
            if !searchText.isEmpty {
                Button(action: {
                    searchText = ""
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.grayUniversal)
                        .padding(.trailing, 10)
                })
            }
        }
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

#Preview {
    SearchBarView(searchText: .constant(""))
}
