import Foundation
import Combine

protocol GetHeroesUseCaseProtocol {
    func execute() -> AnyPublisher<[Hero], ApiError>
}
