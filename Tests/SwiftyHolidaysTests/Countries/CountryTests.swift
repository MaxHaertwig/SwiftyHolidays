import XCTest
@testable import SwiftyHolidays

final class CountryTests: XCTestCase {
    func testAllCountries() {
        for country in Country.allCases {
            _ = country.allHolidays(in: 2020)
        }
    }

    func testAllCountriesWithStates() {
        for countryWithState in CountryWithState.allCases {
            _ = countryWithState.allHolidays(in: 2020)
        }
    }

    func testInitWithIsoCode() {
        XCTAssertNil(Country(isoCode: "xxx"))
        XCTAssertNotNil(Country(isoCode: "de"))
        XCTAssertNotNil(Country(isoCode: "DE"))
        XCTAssertNotNil(Country(isoCode: "DEU"))
    }

    static var allTests = [
        ("testAllCountries", testAllCountries),
        ("testAllCountriesWithStates", testAllCountriesWithStates),
        ("testInitWithIsoCode", testInitWithIsoCode)
    ]
}
