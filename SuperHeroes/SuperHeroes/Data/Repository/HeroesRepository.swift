import Foundation
import Combine

struct HeroesRepository: HeroesRepositoryProtocol {
    private let network: HeroesNetworkProtocol
    
    init(network: HeroesNetworkProtocol = HeroesNetwork()) {
        self.network = network
    }
    
    func getHeroes() -> AnyPublisher<ModelDataContainer<Hero>, ApiError> {
        network.getHeroes()
    }
}
