import Foundation

protocol HeroContainerDTOToDomainMapperProtocol {
    func map(_ modelDTO: ModelDataContainerDTO<HeroDTO>?) -> ModelDataContainer<Hero>
}
