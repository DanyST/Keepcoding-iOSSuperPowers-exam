import Foundation
import Combine

final class CharacterNetwork: CharacterNetworkProtocol {
    private let networkProvider: NetworkProviderProtocol
    
    init(networkProvider: NetworkProviderProtocol = NetworkProvider()) {
        self.networkProvider = networkProvider
    }
        
    func getCharacters() -> AnyPublisher<ModelDataWrapperDTO<HeroDTO>, ApiError> {
        let params: [String: Any] = [
            "apikey": ApiConfig.apikey,
            "hash": ApiConfig.hash,
            "ts": ApiConfig.ts
        ]
        
        return networkProvider.request(
            of: ModelDataWrapperDTO<HeroDTO>.self,
            from: .heroes(params: params),
            additionalHeaders: nil
        )
    }
}
