import Foundation
import Combine

struct HeroesNetwork: HeroesNetworkProtocol {
    private let networkProvider: NetworkProviderProtocol
    private let heroContainerDTOToDomainMapper: HeroContainerDTOToDomainMapperProtocol
    private let serieContainerDTOToDomainMapper: SerieContainerDTOToDomainMapperProtocol
    
    init(
        networkProvider: NetworkProviderProtocol = NetworkProvider(),
        heroContainerDTOToDomainMapper: HeroContainerDTOToDomainMapperProtocol = HeroContainerDTOToDomainMapper(),
        serieContainerDTOToDomainMapper: SerieContainerDTOToDomainMapperProtocol = SerieContainerDTOToDomainMapper()
    ) {
        self.networkProvider = networkProvider
        self.heroContainerDTOToDomainMapper = heroContainerDTOToDomainMapper
        self.serieContainerDTOToDomainMapper = serieContainerDTOToDomainMapper
    }
        
    func getHeroes() -> AnyPublisher<ModelDataContainer<Hero>, ApiError> {
        let params: [String: Any] = ApiConfig.toDictionary
        
        return networkProvider.request(
            of: ModelDataWrapperDTO<HeroDTO>.self,
            from: .heroes(params: params),
            additionalHeaders: nil
        )
        .map { modelDataWrapperDTO in
            self.heroContainerDTOToDomainMapper.map(modelDataWrapperDTO.data)
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    func getSeries(by heroId: String) -> AnyPublisher<ModelDataContainer<Serie>, ApiError> {
        let params: [String: Any] = ApiConfig.toDictionary
        
        return networkProvider.request(
            of: ModelDataWrapperDTO<SerieDTO>.self,
            from: .series(heroId: heroId, additionalParams: params),
            additionalHeaders: nil
        )
        .map { modelDataWrapperDTO in
            self.serieContainerDTOToDomainMapper.map(modelDataWrapperDTO.data)
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
