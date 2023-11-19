import Foundation
import Combine

protocol NetworkProviderProtocol {
    func request<T: Decodable>(
        of type: T.Type,
        from endpoint: SuperHeroesEndpoint,
        additionalHeaders: [String: String]?
    ) -> AnyPublisher<T, ApiError> where T: Decodable
}
