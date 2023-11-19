import XCTest
import Combine
@testable import SuperHeroes

final class GetSeriesByHeroUseCaseTests: XCTestCase {
    var sut: GetSeriesByHeroUseCase!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = GetSeriesByHeroUseCase(heroesRepository: HeroesRepository(network: HeroesNetworkMockSuccess()))
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetSeriesByHeroUseCase_execute_receiveValueSuccessfully() {
        let expectation = expectation(description: "Get Series Success")
        var suscribers = Set<AnyCancellable>()
        
        sut.execute(heroId: "")
            .sink { completion in
                switch completion {
                case let .failure(error):
                    XCTFail(error.localizedDescription)
                default: break
                }
            } receiveValue: { series in
                XCTAssertEqual(series.count, 1)
                XCTAssertEqual(series[0].id, "1614")
                XCTAssertEqual(series[0].title, "HOUSE OF M: WORLD OF M FEATURING WOLVERINE TPB (2006)")
                XCTAssertEqual(series[0].description, "")
                XCTAssertEqual(series[0].startYear, 2006)
                XCTAssertEqual(series[0].endYear, 2006)
                XCTAssertEqual(series[0].rating, "T")
                XCTAssertEqual(series[0].type, "collection")
                XCTAssertEqual(series[0].modified, "-0001-11-30T00:00:00-0500")
                XCTAssertEqual(series[0].thumbnail, "https://i.annihil.us/u/prod/marvel/i/mg/9/60/4bc62e83db473.jpg")
                expectation.fulfill()
            }
            .store(in: &suscribers)
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testGetSeriesByHeroUseCase_execute_getFailure() {
        sut = GetSeriesByHeroUseCase(heroesRepository: HeroesRepository(network: HeroesNetworkMockFailure()))
        
        let expectation = expectation(description: "Get Series Failure")
        var suscribers = Set<AnyCancellable>()
        
        sut.execute(heroId: "")
            .sink { completion in
                switch completion {
                case let .failure(error):
                    XCTAssertNotNil(error)
                    XCTAssertEqual(error, .unknown)
                    expectation.fulfill()
                case .finished:
                    XCTFail()
                }
            } receiveValue: { _ in
                XCTFail()
            }
            .store(in: &suscribers)
        
        wait(for: [expectation], timeout: 5)
    }
}
