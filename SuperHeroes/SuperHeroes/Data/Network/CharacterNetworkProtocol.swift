import Foundation
import Combine

protocol CharacterNetworkProtocol {
    func getCharacters() -> AnyPublisher<ModelDataContainer<Hero>, ApiError>
}
