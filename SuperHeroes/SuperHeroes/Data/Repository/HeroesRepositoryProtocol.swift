import Foundation
import Combine

protocol HeroesRepositoryProtocol {
    func getHeroes() -> AnyPublisher<ModelDataContainer<Hero>, ApiError>
}
