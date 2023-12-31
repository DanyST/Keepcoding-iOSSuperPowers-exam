import Foundation

struct SerieDTO: Decodable {
    let id: Int?
    let title: String?
    let description: String?
    let startYear: Int?
    let endYear: Int?
    let rating: String?
    let type: String?
    let modified: String?
    let thumbnail: ThumbnailImageDTO?
}
