import Foundation

struct Hero {
    let id: String
    let name: String
    let description: String
    let modified: String?
    let thumbnail: String?
}

extension Hero: Identifiable {}
