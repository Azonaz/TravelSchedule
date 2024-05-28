import SwiftUI

struct StoryPreView: View {
    let stories: [Story]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(stories) { story in
                    ZStack(alignment: .bottomLeading) {
                        story.image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 92, height: 140)
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.blueUniversal, lineWidth: 4)
                            )

                        Text(story.title)
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
    StoryPreView(stories: Story.stories)
}
