import SwiftUI

struct StoryPreView: View {
    @ObservedObject var viewModel = StoryViewModel()
    @State private var showFullScreen = false

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(viewModel.stories.indices, id: \.self) { index in
                    ZStack(alignment: .bottomLeading) {
                        viewModel.stories[index].image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 92, height: 140)
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(viewModel.stories[index].isViewed ? Color.clear : Color.blueUniversal,
                                            lineWidth: 4)
                            )
                            .opacity(viewModel.stories[index].isViewed ? 0.5 : 1.0)

                        Text(viewModel.stories[index].title)
                            .font(.regular12)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .lineLimit(3)
                            .frame(width: 76)
                            .padding(8)
                    }
                    .onTapGesture {
                        viewModel.selectedStoryIndex = index
                        showFullScreen.toggle()
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding([.top, .bottom], 24)
        }
        .fullScreenCover(isPresented: $showFullScreen) {
            StoriesView(viewModel: viewModel)
        }
    }
}

#Preview {
    StoryPreView()
}
