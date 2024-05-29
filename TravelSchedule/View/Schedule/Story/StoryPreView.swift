import SwiftUI

struct StoryPreView: View {
    @ObservedObject var viewModel = StoryViewModel()

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(viewModel.stories.indices, id: \.self) { index in
                    NavigationLink(destination: StoriesView(viewModel: viewModel)) {
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
                                .lineLimit(3)
                                .frame(width: 92, alignment: .leading)
                                .padding(8)
                        }
                    }
                    .simultaneousGesture(
                        TapGesture()
                            .onEnded {
                                viewModel.selectedStoryIndex = index
                            }
                    )
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
