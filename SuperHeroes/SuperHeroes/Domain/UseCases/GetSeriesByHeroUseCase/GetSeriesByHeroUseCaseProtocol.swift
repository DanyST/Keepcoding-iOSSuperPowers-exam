import Foundation
import Combine

protocol GetSeriesByHeroUseCaseProtocol {
    func execute(heroId: String) -> AnyPublisher<[Serie], ApiError>
}
