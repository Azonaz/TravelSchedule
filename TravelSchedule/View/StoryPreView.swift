import SwiftUI

struct StoryPreView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(0..<4) { index in
                    ZStack(alignment: .bottomLeading) {
                        Image("story\(index + 1)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 92, height: 140)
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.blueUniversal, lineWidth: 4)
                            )

                        Text("Text Text Text Text Text Text Text \(index + 1)")
                            .font(.regular12)
                            .foregroundColor(.white)
                            .lineLimit(3)
                            .frame(width: 92, alignment: .leading)
                            .padding(8)
                    }
                }
            }
            .padding(.leading, 16)
            .padding([.top, .bottom], 24)
        }
    }
}

#Preview {
    StoryPreView()
}
