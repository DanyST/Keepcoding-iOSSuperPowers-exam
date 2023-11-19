import XCTest
import Combine
@testable import SuperHeroes

final class ThumbnailImageDTOToStringMapperTests: XCTestCase {
    var sut: ThumbnailImageDTOToStringMapper!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ThumbnailImageDTOToStringMapper()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testMapper_MapData_GetSuccess() throws {
        let thumbnail = sut.map(ThumbnailImageDTO(path: "https://google.com/image", thumbnailExtension: .jpg))
        XCTAssertNotNil(thumbnail)
        XCTAssertEqual(thumbnail, "https://google.com/image.jpg")
        
        let thumbnailWithUnSafeURL = sut.map(ThumbnailImageDTO(path: "http://google.com/image", thumbnailExtension: .jpg))
        XCTAssertNotNil(thumbnailWithUnSafeURL)
        XCTAssertEqual(thumbnailWithUnSafeURL, "https://google.com/image.jpg")
    }
    
    func testMapper_MapNil_GetSuccess() throws {
        let thumbnailString = sut.map(nil)
        XCTAssertNil(thumbnailString)
        
        let thumbnailOnlyPath = sut.map(ThumbnailImageDTO(path: "http://google.com/image", thumbnailExtension: nil))
        XCTAssertNil(thumbnailOnlyPath)
        
        let thumbnailOnlyExtension = sut.map(ThumbnailImageDTO(path: nil, thumbnailExtension: .jpg))
        XCTAssertNil(thumbnailOnlyExtension)
    }
}
