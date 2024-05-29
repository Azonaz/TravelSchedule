import Foundation

final class StoryViewModel: ObservableObject {
    @Published var stories: [Story]
    @Published var selectedStoryIndex: Int = 0

    init() {
        self.stories = Story.stories
    }

    func selectStory(at index: Int) {
            selectedStoryIndex = index
        }
}
