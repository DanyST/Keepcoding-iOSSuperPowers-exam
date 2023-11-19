import Foundation

struct HeroDTO: Decodable {
    let id: Int?
    let name: String?
    let description: String?
    let modified: String?
    let thumbnail: ThumbnailImageDTO?
}
