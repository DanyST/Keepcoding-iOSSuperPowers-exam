import Foundation
import Combine

final class HeroDetailViewModel: ObservableObject {
    private let getSeriesByHeroUseCase: GetSeriesByHeroUseCaseProtocol
    private var suscriptors = Set<AnyCancellable>()
    
    @Published var status: Status = .none
    @Published var series = [Serie]()
    @Published private(set) var hero: Hero
    
    init(
        hero: Hero,
        getSeriesByHeroUseCase: GetSeriesByHeroUseCaseProtocol = GetSeriesByHeroUseCase()
    ) {
        self._hero = Published(initialValue: hero)
        self.getSeriesByHeroUseCase = getSeriesByHeroUseCase
        getSeries(by: hero.id)
    }
    
    func getSeries(by heroId: String) {
        getSeriesByHeroUseCase.execute(heroId: heroId)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.status = .loaded
                case let .failure(error):
                    print("Error: ", error)
                    self?.status = .error(error: "")
                }
            } receiveValue: { [weak self] series in
                self?.series = series
            }
            .store(in: &suscriptors)
    }
    
    func getSerieDetailViewModel(serie: Serie) -> SerieDetailViewModel {
        SerieDetailViewModel(serie: serie)
    }
}
