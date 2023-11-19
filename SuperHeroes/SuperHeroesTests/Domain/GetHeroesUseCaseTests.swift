import XCTest
import Combine
@testable import SuperHeroes

final class GetHeroesUseCaseTests: XCTestCase {
    var sut: GetHeroesUseCase!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = GetHeroesUseCase(heroesRepository: HeroesRepository(network: HeroesNetworkMockSuccess()))
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetHeroesUseCase_execute_receiveValueSuccessfully() {
        let expectation = expectation(description: "Get Heroes Success")
        var suscribers = Set<AnyCancellable>()
        
        sut.execute()
            .sink { completion in
                switch completion {
                case let .failure(error):
                    XCTFail(error.localizedDescription)
                default: break
                }
            } receiveValue: { heroes in
                XCTAssertEqual(heroes.count, 20)
                XCTAssertEqual(heroes[0].id, "1010914")
                XCTAssertEqual(heroes[0].name, "Captain America (House of M)")
                XCTAssertEqual(heroes[0].description, "")
                XCTAssertEqual(heroes[0].modified, "2014-03-05T13:17:50-0500")
                XCTAssertEqual(heroes[0].thumbnail, "https://i.annihil.us/u/prod/marvel/i/mg/6/10/53176a1e7c0d5.jpg")
                expectation.fulfill()
            }
            .store(in: &suscribers)
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testGetHeroesUseCase_execute_getFailure() {
        sut = GetHeroesUseCase(heroesRepository: HeroesRepository(network: HeroesNetworkMockFailure()))
        
        let expectation = expectation(description: "Get Heroes Failure")
        var suscribers = Set<AnyCancellable>()
        
        sut.execute()
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
