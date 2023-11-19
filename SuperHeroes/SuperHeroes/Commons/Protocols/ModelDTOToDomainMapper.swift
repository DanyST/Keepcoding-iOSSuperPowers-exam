import Foundation

protocol ModelDTOToDomainMapper {
    associatedtype ModelDTO
    associatedtype ModelDomain
    
    func map(_ modelDTO: ModelDTO?) -> ModelDomain
}
