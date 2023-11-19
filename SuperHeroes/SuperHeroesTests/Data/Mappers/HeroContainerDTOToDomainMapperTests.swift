import XCTest
import Combine
@testable import SuperHeroes

final class HeroContainerDTOToDomainMapperTests: XCTestCase {
    var sut: HeroContainerDTOToDomainMapper!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = HeroContainerDTOToDomainMapper()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testMapper_MapData_GetSuccess() throws {
        let modelDataWrapperDTO = try XCTUnwrap(try? getJSONModel(ModelDataWrapperDTO<HeroDTO>.self, resource: "characters"))
        let modelDataContainer = sut.map(modelDataWrapperDTO.data)
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
