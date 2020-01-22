import XCTest
@testable import SwiftyHolidays

final class CountryBaseTests: XCTestCase {
    func testBuildHolidays() {
        let countryBase = CountryBase()
        let holidays = countryBase.buildHolidays(year: 2020) { builder in
            builder.addHoliday("A", date: (.march, 16))
        }
        XCTAssertEqual(holidays.count, 1)
        XCTAssertEqual(holidays[0], Holiday(name: "A", date: (2020, .march, 16)))
    }

    static var allTests = [
        ("testBuildHolidays", testBuildHolidays)
    ]
}
