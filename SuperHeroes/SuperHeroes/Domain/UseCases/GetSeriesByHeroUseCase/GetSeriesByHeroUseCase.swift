import Foundation
import Combine

struct GetSeriesByHeroUseCase: GetSeriesByHeroUseCaseProtocol {
    private let heroesRepository: HeroesRepositoryProtocol
    
    init(heroesRepository: HeroesRepositoryProtocol = HeroesRepository()) {
        self.heroesRepository = heroesRepository
    }
    
    func execute(heroId: String) -> AnyPublisher<[Serie], ApiError> {
        heroesRepository.getSeries(by: heroId)
            .map {
                $0.results
            }
            .eraseToAnyPublisher()
    }
}
