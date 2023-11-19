import Foundation
import Combine

struct HeroesNetwork: HeroesNetworkProtocol {
    private let networkProvider: NetworkProviderProtocol
    private let heroContainerDTOToDomainMapper: HeroContainerDTOToDomainMapper
    
    init(
        networkProvider: NetworkProviderProtocol = NetworkProvider(),
        heroContainerDTOToDomainMapper: HeroContainerDTOToDomainMapper = HeroContainerDTOToDomainMapper()
    ) {
        self.networkProvider = networkProvider
        self.heroContainerDTOToDomainMapper = heroContainerDTOToDomainMapper
    }
        
    func getHeroes() -> AnyPublisher<ModelDataContainer<Hero>, ApiError> {
        let params: [String: Any] = [
            "apikey": ApiConfig.apikey,
            "hash": ApiConfig.hash,
            "ts": ApiConfig.ts
        ]
        
        return networkProvider.request(
            of: ModelDataWrapperDTO<HeroDTO>.self,
            from: .heroes(params: params),
            additionalHeaders: nil
        )
        .map {modelDataWrapperDTO in
            self.heroContainerDTOToDomainMapper.map(modelDataWrapperDTO.data)
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
