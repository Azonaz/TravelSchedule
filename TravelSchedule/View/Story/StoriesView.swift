import SwiftUI

struct StoriesView: View {
    @ObservedObject var storyViewModel: StoryViewModel
    @Environment(\.presentationMode) var presentationMode
    private var timerConfiguration: TimerConfiguration { .init(storiesCount: storyViewModel.stories.count) }
    private let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    @State private var previousCurrentStoryIndex: Int?
    @State private var previousCurrentProgress: CGFloat?
    @State private var currentProgress: CGFloat = 0
    @State private var currentStoryIndex: Int = 0

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.black.edgesIgnoringSafeArea(.all)
            storiesView
            CloseButton()
                .padding(.top, 57)
                .padding(.trailing, 12)
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            currentStoryIndex = storyViewModel.selectedStoryIndex
            markCurrentStoryAsViewed()
        }
        .onChange(of: currentStoryIndex) { newIndex in
            didChangeCurrentIndex(newIndex: newIndex)
            markCurrentStoryAsViewed()
        }
        .gesture(
            DragGesture()
                .onEnded { gesture in
                    if gesture.translation.height > 100 {
                        withAnimation {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
        )
        .onReceive(timer) { _ in
            if currentStoryIndex == storyViewModel.stories.count - 1 {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }

    private var storiesView: some View {
        ZStack(alignment: .topTrailing) {
            StoriesTabView(stories: storyViewModel.stories, currentStoryIndex: $currentStoryIndex)
                .onAppear {
                    previousCurrentStoryIndex = currentStoryIndex == 0 ? currentStoryIndex : currentStoryIndex - 1
                }
                .onChange(of: currentStoryIndex) { newIndex in
                    didChangeCurrentIndex(newIndex: newIndex)
                }

            StoriesProgressBar(
                storiesCount: storyViewModel.stories.count,
                timerConfiguration: timerConfiguration,
                currentProgress: $currentProgress
            )
            .padding(.init(top: 28, leading: 12, bottom: 12, trailing: 12))
            .onAppear {
                previousCurrentProgress = currentProgress
            }
            .onChange(of: currentProgress) { newProgress in
                didChangeCurrentProgress(newProgress: newProgress)
            }
        }
    }

    private func didChangeCurrentIndex(newIndex: Int) {
        guard let oldIndex = previousCurrentStoryIndex else {
            previousCurrentStoryIndex = newIndex
            return
        }
        guard oldIndex != newIndex else { return }
        let progress = timerConfiguration.progress(for: newIndex)
        guard let previousProgress = previousCurrentProgress, abs(progress - previousProgress) >= 0.01 else { return }
        withAnimation {
            currentProgress = progress
        }
        previousCurrentStoryIndex = newIndex
    }

    private func didChangeCurrentProgress(newProgress: CGFloat) {
        guard previousCurrentProgress != nil else {
            previousCurrentProgress = newProgress
            return
        }
        let index = timerConfiguration.index(for: newProgress)
        guard index != currentStoryIndex else { return }
        withAnimation {
            currentStoryIndex = index
        }
        previousCurrentProgress = newProgress
    }

    private func markCurrentStoryAsViewed() {
        storyViewModel.stories[currentStoryIndex].isViewed = true
    }
}

#Preview {
    StoriesView(storyViewModel: StoryViewModel())
}
