import Foundation

struct ThumbnailImageDTOToStringMapper: ThumbnailImageDTOToStringMapperProtocol {
    func map(_ modelDTO: ThumbnailImageDTO?) -> String? {
        guard
            let path = modelDTO?.path,
            let extensionImage = modelDTO?.thumbnailExtension
        else {
            return nil
        }
        
        var urlComponents = URLComponents(string: "\(path).\(extensionImage.rawValue)")
        urlComponents?.scheme = "https"
        return urlComponents?.string
    }
}
