import Foundation
import Combine

protocol CharacterNetworkProtocol {
    func getCharacters() -> AnyPublisher<ModelDataWrapperDTO<HeroDTO>, ApiError>
}
