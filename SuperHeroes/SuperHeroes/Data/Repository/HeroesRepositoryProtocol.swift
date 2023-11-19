import Foundation
import Combine

protocol HeroesRepositoryProtocol {
    func getHeroes() -> AnyPublisher<ModelDataContainer<Hero>, ApiError>
    func getSeries(by heroId: String) -> AnyPublisher<ModelDataContainer<Serie>, ApiError>
}
