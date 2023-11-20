import XCTest
@testable import SuperHeroes
import ViewInspector

final class HeroRowViewTests: XCTestCase {
    var sut: HeroRowView!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = HeroRowView(hero: Hero(id: "", name: "Thor", description: "", modified: "", thumbnail: nil))
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testHeroRowView_NotNil() {
        XCTAssertNotNil(sut)
    }
    
    func testHeroRowView_findImage_exist() throws {
        let img = try sut.inspect().find(viewWithId: 0)
        XCTAssertNotNil(img)
    }
    
    func testHeroRowView_findRectangle_exist() throws {
        let rectangleBackground = try sut.inspect().find(viewWithId: 1)
        XCTAssertNotNil(rectangleBackground)
    }
    
    func testHeroRowView_findText_CorrectValues() throws {
        let text = try sut.inspect().find(viewWithId: 2)
        XCTAssertNotNil(text)
        
        let textString = try text.text().string()
        XCTAssertEqual(textString, "Thor")
    }
}
