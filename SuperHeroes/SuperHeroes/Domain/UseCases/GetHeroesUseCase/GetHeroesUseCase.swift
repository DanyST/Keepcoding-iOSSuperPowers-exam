import Foundation
import Combine

struct GetHeroesUseCase: GetHeroesUseCaseProtocol {
    private let heroesRepository: HeroesRepositoryProtocol
    
    init(heroesRepository: HeroesRepositoryProtocol = HeroesRepository()) {
        self.heroesRepository = heroesRepository
    }
    
    func execute() -> AnyPublisher<[Hero], ApiError> {
        heroesRepository.getHeroes()
            .map {
                $0.results
            }
            .eraseToAnyPublisher()
    }
}
