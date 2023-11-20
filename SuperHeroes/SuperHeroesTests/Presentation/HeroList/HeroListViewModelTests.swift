import XCTest
import Combine
@testable import SuperHeroes

final class HeroListViewModelTests: XCTestCase {
    var sut: HeroListViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let getheroesUseCase = GetHeroesUseCase(heroesRepository: HeroesRepository(network: HeroesNetworkMockSuccess()))
        sut = HeroListViewModel(getHeroesUseCase: getheroesUseCase)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testHeroListViewModel_GetHeroes_GetTheCorrectHeroes() {
        let expectation = expectation(description: "Get heroes")
        var suscribers = Set<AnyCancellable>()
        sut.getHeroes()
        
        sut.$heroes.sink { heroes in
            XCTAssertEqual(self.sut.heroes.count, 20)
            XCTAssertEqual(self.sut.heroes[0].id, "1010914")
            XCTAssertEqual(self.sut.heroes[0].name, "Captain America (House of M)")
            XCTAssertEqual(self.sut.heroes[0].description, "")
            XCTAssertEqual(self.sut.heroes[0].modified, "2014-03-05T13:17:50-0500")
            XCTAssertEqual(self.sut.heroes[0].thumbnail, "https://i.annihil.us/u/prod/marvel/i/mg/6/10/53176a1e7c0d5.jpg")
            expectation.fulfill()
        }.store(in: &suscribers)
  
        wait(for: [expectation], timeout: 5)
    }
    
    func testHeroListViewModel_GetHeroDetailViewModel_ReturnNotNil() {
        let heroDetailViewModel = sut.heroDetailViewModel(hero: Hero(id: "", name: "", description: "", modified: "", thumbnail: ""))
        XCTAssertNotNil(heroDetailViewModel)
    }
}
