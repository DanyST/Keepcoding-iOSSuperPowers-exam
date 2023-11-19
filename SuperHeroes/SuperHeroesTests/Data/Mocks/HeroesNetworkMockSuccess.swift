import Foundation
import Combine
@testable import SuperHeroes

final class HeroesNetworkMockSuccess: HeroesNetworkProtocol {
    func getHeroes() -> AnyPublisher<ModelDataContainer<Hero>, ApiError> {
        guard let modelDataWrapperDTO =  try? getJSONModel(ModelDataWrapperDTO<HeroDTO>.self, resource: "characters") else {
            return Fail(error: ApiError.decodingData)
                .eraseToAnyPublisher()
        }
        
        let modelDataContainer = HeroContainerDTOToDomainMapper().map(modelDataWrapperDTO.data)
        
        let publisher = CurrentValueSubject<ModelDataContainer<Hero>, ApiError>(modelDataContainer)
            .eraseToAnyPublisher()
        
        return publisher
    }
    
    func getSeries(by heroId: String) -> AnyPublisher<ModelDataContainer<Serie>, ApiError> {
        guard let modelDataWrapperDTO =  try? getJSONModel(ModelDataWrapperDTO<SerieDTO>.self, resource: "series") else {
            return Fail(error: ApiError.decodingData)
                .eraseToAnyPublisher()
        }
        
        let modelDataContainer = SerieContainerDTOToDomainMapper().map(modelDataWrapperDTO.data)
        
        let publisher = CurrentValueSubject<ModelDataContainer<Serie>, ApiError>(modelDataContainer)
            .eraseToAnyPublisher()
        
        return publisher
    }
}
