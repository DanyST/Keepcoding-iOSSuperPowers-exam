import Foundation

struct ThumbnailImageDTO: Decodable {
    let path: String?
    let thumbnailExtension: ExtensionImage?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}
