import SwiftUI

struct Story {
    let id: Int
    let image: Image
    let title: String
    let description: String
    var isViewed: Bool = false

    static let stories: [Story] = (0..<6).map { index in
        Story(
            id: index,
            image: Image("story\(index + 1)"),
            title: "Text Text Text Text Text Text Text Text Text Text",
            description: "Text Text Text Text Text Text Text Text Text" +
            "Text Text Text Text Text Text Text Text Text Text Text Text"
        )
    }
}

extension Story: Identifiable {}
