import Foundation

typealias EndpointParameters = [String: Any?]

enum SuperHeroesEndpoint {
    case heroes(params: EndpointParameters)
    case series(heroId: String, additionalParams: EndpointParameters)
}

extension SuperHeroesEndpoint {
    var method: HTTPMethod {
        switch self {
        case .heroes, .series:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .heroes:
            return "/characters"
        case let .series(heroId, _):
            return "/characters/\(heroId)/series"
        }
    }
    
    var parameters: EndpointParameters {
        switch self {
        case let .heroes(params), let .series(_, params):
            return params
        }
    }
}

extension SuperHeroesEndpoint {
    func request(with baseURL: URL) -> URLRequest? {
        let url = baseURL.appendingPathComponent(path)
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.queryItems = queryItems
        
        guard let urlByComponents = components.url else {
            return nil
        }
        var request = URLRequest(url: urlByComponents)
        request.httpMethod = method.rawValue
        request.httpBody = jsonBody
        
        return request
    }
    
    private var queryItems: [URLQueryItem]? {
        guard method == .get else { return nil }
        let queryItems = parameters.map {
            guard let value = $0.value else {
                return URLQueryItem(name: $0.key, value: nil)
            }
            
            let valueString = String(describing: value)
            return URLQueryItem(name: $0.key, value: valueString)
        }
        return queryItems
    }
    
    private var jsonBody: Data? {
        guard method == .post else { return nil }
        return try? JSONSerialization.data(
            withJSONObject: parameters,
            options: .prettyPrinted
        )
    }
}
