import XCTest
@testable import SuperHeroes

final class ApiConfigTests: XCTestCase {

    func testApiConfig_toDiccionary_GetCorrectValues() {
        let apiConfigDictionary = ApiConfig.toDictionary
        
        XCTAssertEqual(apiConfigDictionary["hash"] as? String, ApiConfig.hash)
        XCTAssertEqual(apiConfigDictionary["apikey"] as? String, ApiConfig.apikey)
        XCTAssertEqual(apiConfigDictionary["ts"] as? String, ApiConfig.ts)
    }
}
