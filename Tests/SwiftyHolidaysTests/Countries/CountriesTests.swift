import XCTest
@testable import SwiftyHolidays

final class CountriesTests: XCTestCase {
    func testAllCountries() {
        for country in Country.allCases {
            _ = country.allHolidays(year: 2020)
        }
    }

    func testAllCountriesWithStates() {
        for countryWithState in CountryWithState.allCases {
            _ = countryWithState.allHolidays(year: 2020)
        }
    }

    func testNumberOfStates() {
        XCTAssertEqual(GermanState.allCases.count, 16)
        XCTAssertEqual(USState.allCases.count, 50)
    }

    static var allTests = [
        ("testNumberOfStates", testNumberOfStates)
    ]
}
