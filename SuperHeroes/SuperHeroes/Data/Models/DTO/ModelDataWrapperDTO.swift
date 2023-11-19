import Foundation

struct ModelDataWrapperDTO<T: Decodable>: Decodable {
    let code: Int?
    let status : String?
    let copyright: String?
    let attributionText: String?
    let attributionHTML: String?
    let etag: String?
    let data: ModelDataContainerDTO<T>?
}
