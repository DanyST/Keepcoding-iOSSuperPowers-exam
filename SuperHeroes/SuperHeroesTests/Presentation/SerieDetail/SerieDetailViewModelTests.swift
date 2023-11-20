import XCTest
import Combine
@testable import SuperHeroes

final class SerieDetailViewModelTests: XCTestCase {
    var sut: SerieDetailViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = SerieDetailViewModel(serie: Serie(
            id: "1234",
            title: "Hulk",
            description: "Description",
            startYear: 2023,
            endYear: 2023,
            rating: "T",
            type: "collection",
            modified: "",
            thumbnail: nil)
        )
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testSerieDetailViewModel_Init() {
        XCTAssertNotNil(sut)
        let expectation = expectation(description: "Init ViewModel with Serie")
        var suscribers = Set<AnyCancellable>()
        
        sut.$serie.sink { serie in
            XCTAssertEqual(serie.id, "1234")
            XCTAssertEqual(serie.title, "Hulk")
            XCTAssertEqual(serie.description, "Description")
            XCTAssertEqual(serie.startYear, 2023)
            XCTAssertEqual(serie.endYear, 2023)
            XCTAssertEqual(serie.rating, "T")
            XCTAssertEqual(serie.type, "collection")
            XCTAssertEqual(serie.modified, "")
            XCTAssertEqual(serie.thumbnail, nil)
            expectation.fulfill()
        }
        .store(in: &suscribers)
        
        wait(for: [expectation], timeout: 5)
    }
}
