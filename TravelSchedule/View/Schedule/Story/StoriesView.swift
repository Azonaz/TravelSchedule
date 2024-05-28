import SwiftUI

struct StoriesView: View {
    let stories: [Story]
    private var timerConfiguration: TimerConfiguration { .init(storiesCount: stories.count) }
    @State private var previousCurrentStoryIndex: Int?
    @State private var previousCurrentProgress: CGFloat?
    @State private var currentStoryIndex: Int = 0
    @State private var currentProgress: CGFloat = 0

    var body: some View {
        ZStack(alignment: .topTrailing) {
            storiesView
            CloseButton()
                .padding(.top, 57)
                .padding(.trailing, 12)
        }
    }

    private var storiesView: some View {
        ZStack(alignment: .topTrailing) {
            StoriesTabView(stories: stories, currentStoryIndex: $currentStoryIndex)
                .onAppear {
                    previousCurrentStoryIndex = currentStoryIndex
                }
                .onChange(of: currentStoryIndex) { newIndex in
                    didChangeCurrentIndex(newIndex: newIndex)
                }

            StoriesProgressBar(
                storiesCount: stories.count,
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
}

#Preview {
    StoriesView(stories: Story.stories)
}
