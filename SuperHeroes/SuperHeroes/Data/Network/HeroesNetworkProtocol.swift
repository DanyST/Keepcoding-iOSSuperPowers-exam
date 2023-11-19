import Foundation
import Combine

protocol HeroesNetworkProtocol {
    func getHeroes() -> AnyPublisher<ModelDataContainer<Hero>, ApiError>
}
