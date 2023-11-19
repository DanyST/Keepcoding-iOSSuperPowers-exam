import XCTest
import Combine
@testable import SuperHeroes

final class SerieContainerDTOToDomainMapperTests: XCTestCase {
    var sut: SerieContainerDTOToDomainMapper!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = SerieContainerDTOToDomainMapper()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testMapper_MapData_GetSuccess() throws {
        let modelDataWrapperDTO = try XCTUnwrap(try? getJSONModel(ModelDataWrapperDTO<SerieDTO>.self, resource: "series"))
        let modelDataContainer = sut.map(modelDataWrapperDTO.data)
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
    }
    
    func testMapper_MapNil_GetSuccess() throws {
        let modelDataContainer = sut.map(nil)
        XCTAssertNotNil(modelDataContainer)
        XCTAssertEqual(modelDataContainer.offset, 0)
        XCTAssertEqual(modelDataContainer.limit, 0)
        XCTAssertEqual(modelDataContainer.total, 0)
        XCTAssertEqual(modelDataContainer.count, 0)
        XCTAssertEqual(modelDataContainer.results.count, 0)
    }
}
