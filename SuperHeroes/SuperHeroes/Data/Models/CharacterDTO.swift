import Foundation

struct CharacterDTO: Decodable {
    let id: Int?
    let name: String?
    let description: String?
    let modified: Date?
    let thumbnail: ThumbnailImageDTO?
}
