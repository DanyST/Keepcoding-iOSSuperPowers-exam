import Foundation
import Combine
@testable import SuperHeroes

final class HeroesNetworkMockFailure: HeroesNetworkProtocol {
    func getHeroes() -> AnyPublisher<ModelDataContainer<Hero>, ApiError> {
        Fail(error: ApiError.unknown).eraseToAnyPublisher()
    }
    
    func getSeries(by heroId: String) -> AnyPublisher<ModelDataContainer<Serie>, ApiError> {
        Fail(error: ApiError.unknown).eraseToAnyPublisher()
    }
}
