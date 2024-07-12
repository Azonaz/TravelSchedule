import SwiftUI

struct StoryPreView: View {
    @ObservedObject var storyViewModel = StoryViewModel()
    @State private var showFullScreen = false

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(storyViewModel.stories.indices, id: \.self) { index in
                    ZStack(alignment: .bottomLeading) {
                        storyViewModel.stories[index].image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 92, height: 140)
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(storyViewModel.stories[index].isViewed ? Color.clear : Color.blueUniversal,
                                            lineWidth: 4)
                            )
                            .opacity(storyViewModel.stories[index].isViewed ? 0.5 : 1.0)

                        Text(storyViewModel.stories[index].title)
                            .font(.regular12)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .lineLimit(3)
                            .frame(width: 76)
                            .padding(8)
                    }
                    .onTapGesture {
                        storyViewModel.selectedStoryIndex = index
                        showFullScreen.toggle()
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding([.top, .bottom], 24)
        }
        .fullScreenCover(isPresented: $showFullScreen) {
            StoriesView(storyViewModel: storyViewModel)
        }
    }
}

#Preview {
    StoryPreView()
}
