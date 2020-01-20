import XCTest
@testable import SwiftyHolidays

final class CountriesTests: XCTestCase {
    func testNumberOfStates() {
        XCTAssertEqual(AustrianState.allCases.count, 9)
        XCTAssertEqual(FrenchDepartment.allCases.count, 95 + 2) // separated departments: Corse, Lyon
        XCTAssertEqual(GermanState.allCases.count, 16)
        XCTAssertEqual(SpanishCommunity.allCases.count, 17 + 2) // autonomous cities: Ceuta, Melilla
        XCTAssertEqual(SwissCanton.allCases.count, 26)
        XCTAssertEqual(USState.allCases.count, 50)
    }

    static var allTests = [
        ("testNumberOfStates", testNumberOfStates)
    ]
}
