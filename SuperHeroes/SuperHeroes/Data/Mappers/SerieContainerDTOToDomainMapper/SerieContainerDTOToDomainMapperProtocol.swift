import Foundation

protocol SerieContainerDTOToDomainMapperProtocol {
    func map(_ modelDTO: ModelDataContainerDTO<SerieDTO>?) -> ModelDataContainer<Serie>
}

