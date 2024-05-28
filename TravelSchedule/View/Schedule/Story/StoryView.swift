import SwiftUI

struct StoryView: View {
    let story: Story

    var body: some View {
        ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .overlay(
                            story.image
                                .resizable()
                                .scaledToFill()
                        )

                    VStack {
                        Spacer()
                        VStack(alignment: .leading, spacing: 10) {
                            Text(story.title)
                                .font(.bold34)
                                .lineLimit(2)
                                .foregroundColor(.white)

                            Text(story.description)
                                .font(.regular20)
                                .lineLimit(3)
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 40)
                    }
                }
               .cornerRadius(40)
               .background(.black)
            }
        }

#Preview {
    StoryView(story: .stories[5])
}
