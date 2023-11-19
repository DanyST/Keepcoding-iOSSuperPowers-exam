import Foundation

struct ThumbnailImageDTOToStringMapper: ThumbnailImageDTOToStringMapperProtocol {
    func map(_ modelDTO: ThumbnailImageDTO?) -> String? {
        guard
            let path = modelDTO?.path,
            let extensionImage = modelDTO?.thumbnailExtension
        else {
            return nil
        }
        
        let securePath = path.replacingOccurrences(of: "http", with: "https")
        return "\(securePath).\(extensionImage.rawValue)"
    }
}
