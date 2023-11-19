import XCTest
import Combine
@testable import SuperHeroes

final class HeroesRepositoryTests: XCTestCase {
    var sut: HeroesRepository!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = HeroesRepository(network: HeroesNetworkMockSuccess())
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testHeroRepository_getheroes_receiveValueSuccessfully() {
        let expectation = expectation(description: "Get Heroes Success")
        var suscribers = Set<AnyCancellable>()
        
        sut.getHeroes()
            .sink { completion in
                switch completion {
                case let .failure(error):
                    XCTFail(error.localizedDescription)
                default: break
                }
            } receiveValue: { modelDataContainer in
                XCTAssertNotNil(modelDataContainer)
                XCTAssertEqual(modelDataContainer.offset, 200)
                XCTAssertEqual(modelDataContainer.limit, 20)
                XCTAssertEqual(modelDataContainer.total, 1563)
                XCTAssertEqual(modelDataContainer.count, 20)
                XCTAssertEqual(modelDataContainer.results.count, 20)
                XCTAssertEqual(modelDataContainer.results[0].id, "1010914")
                XCTAssertEqual(modelDataContainer.results[0].name, "Captain America (House of M)")
                XCTAssertEqual(modelDataContainer.results[0].description, "")
                XCTAssertEqual(modelDataContainer.results[0].modified, "2014-03-05T13:17:50-0500")
                XCTAssertEqual(modelDataContainer.results[0].thumbnail, "https://i.annihil.us/u/prod/marvel/i/mg/6/10/53176a1e7c0d5.jpg")
                expectation.fulfill()
            }
            .store(in: &suscribers)
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testHeroRepository_getHeroes_receiveValueFailure() {
        sut = HeroesRepository(network: HeroesNetworkMockFailure())
        
        let expectation = expectation(description: "Get Heroes Failure")
        var suscribers = Set<AnyCancellable>()
        
        sut.getHeroes()
            .sink { completion in
                switch completion {
                case let .failure(error):
                    XCTAssertNotNil(error)
                    XCTAssertEqual(error, .unknown)
                    expectation.fulfill()
                case .finished:
                    XCTFail()
                }
            } receiveValue: { modelDataContainer in
                XCTFail()
            }
            .store(in: &suscribers)
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testHeroRepository_getSeries_receiveValueSuccessfully() {
        let expectation = expectation(description: "Get Series Successfully")
        var suscribers = Set<AnyCancellable>()
        
        sut.getSeries(by: "")
            .sink { completion in
                switch completion {
                case let .failure(error):
                    XCTFail(error.localizedDescription)
                default: break
                }
            } receiveValue: { modelDataContainer in
                XCTAssertNotNil(modelDataContainer)
                XCTAssertEqual(modelDataContainer.offset, 2)
                XCTAssertEqual(modelDataContainer.limit, 20)
                XCTAssertEqual(modelDataContainer.total, 3)
                XCTAssertEqual(modelDataContainer.count, 1)
                XCTAssertEqual(modelDataContainer.results.count, 1)
                XCTAssertEqual(modelDataContainer.results[0].id, "1614")
                XCTAssertEqual(modelDataContainer.results[0].title, "HOUSE OF M: WORLD OF M FEATURING WOLVERINE TPB (2006)")
                XCTAssertEqual(modelDataContainer.results[0].description, "")
                XCTAssertEqual(modelDataContainer.results[0].startYear, 2006)
                XCTAssertEqual(modelDataContainer.results[0].endYear, 2006)
                XCTAssertEqual(modelDataContainer.results[0].rating, "T")
                XCTAssertEqual(modelDataContainer.results[0].type, "collection")
                XCTAssertEqual(modelDataContainer.results[0].modified, "-0001-11-30T00:00:00-0500")
                XCTAssertEqual(modelDataContainer.results[0].thumbnail, "https://i.annihil.us/u/prod/marvel/i/mg/9/60/4bc62e83db473.jpg")
                expectation.fulfill()
            }
            .store(in: &suscribers)
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testHeroRepository_getSeries_receiveValueFailure() {
        sut = HeroesRepository(network: HeroesNetworkMockFailure())
        
        let expectation = expectation(description: "Get Series Failure")
        var suscribers = Set<AnyCancellable>()
        
        sut.getSeries(by: "")
            .sink { completion in
                switch completion {
                case let .failure(error):
                    XCTAssertNotNil(error)
                    XCTAssertEqual(error, .unknown)
                    expectation.fulfill()
                case .finished:
                    XCTFail()
                }
            } receiveValue: { modelDataContainer in
                XCTFail()
            }
            .store(in: &suscribers)
        
        wait(for: [expectation], timeout: 5)
    }
}
