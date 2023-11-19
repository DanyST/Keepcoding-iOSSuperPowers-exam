import Foundation
import Combine

struct NetworkProvider {
    private let baseUrl = URL(string: "https://gateway.marvel.com/v1/public")
}

extension NetworkProvider: NetworkProviderProtocol {
    func request<T: Decodable>(
        of type: T.Type,
        from endpoint: SuperHeroesEndpoint,
        additionalHeaders: [String: String]?
    ) -> AnyPublisher<T, ApiError> where T: Decodable {
        
        guard
            let baseUrl,
            var request = endpoint.request(with: baseUrl)
        else {
            return Fail(error: ApiError.parsingUrl)
                .eraseToAnyPublisher()
        }
        
        request.setValue(
            "application/json; charset=utf-8",
            forHTTPHeaderField: "Content-Type"
        )
  
        var currentHeaders = request.allHTTPHeaderFields
        currentHeaders?.merge(additionalHeaders ?? [:]) { _, second in second }
        request.allHTTPHeaderFields = currentHeaders
        
        
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap {
                let response = $0.response as? HTTPURLResponse
                guard
                    let response,
                    (200...299) ~= response.statusCode else {
                    throw ApiError.statusError(response?.statusCode)
                }
                return $0.data
            }
            .decode(type: type, decoder: JSONDecoder())
            .mapError { error in
                switch error {
                case is Swift.DecodingError:
                    return ApiError.decodingData
                case is URLError:
                    return ApiError.unknown
                default:
                    guard let apiError = error as? ApiError else {
                        return ApiError.unknown
                    }
                    return apiError
                }
            }
            .eraseToAnyPublisher()
    }
}
