import XCTest
import Combine
@testable import SuperHeroes

final class GetHeroesUIPreviewUseCaseTests: XCTestCase {
    var sut: GetHeroesUIPreviewUseCase!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = GetHeroesUIPreviewUseCase()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetHeroesUIPreviewUseCase_execute_receiveValueSuccessfully() {
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
                XCTAssertEqual(heroes.count, 4)
                XCTAssertEqual(heroes[0].name, "3-D Man")
                XCTAssertEqual(heroes[0].description, "")
                XCTAssertEqual(heroes[0].modified, "2013-09-18T15:54:04-0400")
                XCTAssertEqual(heroes[0].thumbnail, "https://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg")
                expectation.fulfill()
            }
            .store(in: &suscribers)
        
        wait(for: [expectation], timeout: 5)
    }
}
