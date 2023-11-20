import XCTest
@testable import SuperHeroes
import ViewInspector

final class HeroDetailViewTests: XCTestCase {
    var sut: HeroDetailView!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let getSeriesByHeroUseCase = GetSeriesByHeroUseCase(heroesRepository: HeroesRepository(network: HeroesNetworkMockSuccess()))
        
        sut = HeroDetailView(viewModel: HeroDetailViewModel(hero: Hero(id: "", name: "Thor", description: "", modified: "", thumbnail: nil), getSeriesByHeroUseCase: getSeriesByHeroUseCase))
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testHeroDetailView_NotNil() {
        XCTAssertNotNil(sut)
    }
    
    func testHeroDetailView_Views() throws {
        let view = try sut.inspect()
        XCTAssertNotNil(view)
        
        XCTAssertEqual(view.count, 1)
    }
}
