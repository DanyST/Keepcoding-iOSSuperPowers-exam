import Foundation
import Combine

protocol HeroesNetworkProtocol {
    func getHeroes() -> AnyPublisher<ModelDataContainer<Hero>, ApiError>
    func getSeries(by heroId: String) -> AnyPublisher<ModelDataContainer<Serie>, ApiError>
}
