import Foundation

struct CharacterDTO: Codable {
    let id: Int?
    let name, description: String?
    let modified: String?
    let thumbnail: Thumbnail?
    let comics, series: Comics?
    let stories: Stories?

    var imageUrlPath: String {
        (thumbnail?.path ?? "") + "."
        + (thumbnail?.thumbnailExtension ?? "")
    }
}

// MARK: - Comics
struct Comics: Codable {
    let items: [ComicsItem]?
}

// MARK: - ComicsItem
struct ComicsItem: Codable {
    let resourceURI: String?
    let name: String?
    var title: String {
        name ?? ""
    }
}

// MARK: - Stories
struct Stories: Codable {
    let items: [StoriesItem]?
}

// MARK: - StoriesItem
struct StoriesItem: Codable {
    let resourceURI: String?
    let name, type: String?
    var title: String {
        name ?? ""
    }
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String?
    let thumbnailExtension: String?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}
