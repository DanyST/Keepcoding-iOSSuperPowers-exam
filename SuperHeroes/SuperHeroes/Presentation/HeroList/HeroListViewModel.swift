import Foundation
import Combine

final class HeroListViewModel: ObservableObject {
    private let getHeroesUseCase: GetHeroesUseCaseProtocol
    private var suscriptors = Set<AnyCancellable>()
    
    @Published var status: Status = .none
    @Published var heroes = [Hero]()
    
    init(getHeroesUseCase: GetHeroesUseCaseProtocol = GetHeroesUseCase()) {
        self.getHeroesUseCase = getHeroesUseCase
        getHeroes()
    }
    
    func heroDetailViewModel(hero: Hero) -> HeroDetailViewModel {
        HeroDetailViewModel(hero: hero)
    }
    
    func getHeroes() {
        status = .loading
        
        getHeroesUseCase.execute()
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.status = .loaded
                case let .failure(error):
                    print("Error: ", error)
                    self?.status = .error(error: "")
                }
            } receiveValue: { [weak self] heroes in
                self?.heroes = heroes
            }
            .store(in: &suscriptors)
    }
}
