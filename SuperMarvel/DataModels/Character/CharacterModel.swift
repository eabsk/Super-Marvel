import Foundation

struct CharacterModel {
    let id: Int
    let name: String
    let description: String
    let modified: String
    let image: String
    let comics: [ComicsItem]
    let series: [ComicsItem]
    let stories: [StoriesItem]
}
