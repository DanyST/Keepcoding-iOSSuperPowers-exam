import Foundation
import Combine

protocol CharacterNetworkProtocol {
    func getCharacters() -> AnyPublisher<ModelDataWrapperDTO<CharacterDTO>, ApiError>
}
