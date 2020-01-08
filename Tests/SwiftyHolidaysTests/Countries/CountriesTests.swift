import XCTest
@testable import SwiftyHolidays

final class CountriesTests: XCTestCase {
    func testNumberOfStates() {
        XCTAssertEqual(AustrianState.allCases.count, 9)
        XCTAssertEqual(GermanState.allCases.count, 16)
        XCTAssertEqual(SwissCanton.allCases.count, 26)
        XCTAssertEqual(USState.allCases.count, 50)
    }

    static var allTests = [
        ("testNumberOfStates", testNumberOfStates)
    ]
}
