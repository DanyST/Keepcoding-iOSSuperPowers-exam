import XCTest
import Combine
@testable import SuperHeroes

final class SuperHeroesEndpointTests: XCTestCase {
    
    var sut = SuperHeroesEndpoint.self

    func testSuperHeroesEndpoint_heroesRequest_theCorrectValues() {
        let baseURL = URL(string: "https://www.google.com")!
        let apikey = "123456789"
        let request = sut.heroes(params: ["apikey": apikey]).request(with: baseURL)
        XCTAssertEqual(request?.url?.absoluteString, "\(baseURL.absoluteString)/characters?apikey=\(apikey)")
        XCTAssertEqual(request?.httpMethod, "GET")
        XCTAssertEqual(request?.httpBody, nil)
    }
    
    func testSuperHeroesEndpoint_seriesRequest_theCorrectValues() {
        let baseURL = URL(string: "https://www.google.com")!
        let heroId = "1234"
        let apikey = "123456789"
        let request = sut.series(heroId: heroId, additionalParams: ["apikey": apikey]).request(with: baseURL)
        XCTAssertEqual(request?.url?.absoluteString, "\(baseURL.absoluteString)/characters/\(heroId)/series?apikey=\(apikey)")
        XCTAssertEqual(request?.httpBody, nil)
    }
}
