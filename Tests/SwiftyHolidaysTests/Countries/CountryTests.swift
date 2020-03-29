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
    
    func testIso2Code() {
        for country in Country.allCases {
            XCTAssert(country.iso2Code.count == 2)
        }
    }
    
    func testIso3Code() {
        for country in Country.allCases {
            XCTAssert(country.iso3Code.count == 3)
        }
    }
    
    func testDisplayString() {
        let english = Locale(identifier: "en_US")
        XCTAssertEqual(Country.germany.displayString(locale: english), "Germany")
        let german = Locale(identifier: "de_DE")
        XCTAssertEqual(Country.unitedStates.displayString(locale: german), "Vereinigte Staaten")
        for country in Country.allCases {
            for locale in Locale.availableIdentifiers.map({ Locale(identifier: $0) }) {
                XCTAssert(!country.displayString(locale: locale).isEmpty)
            }
        }
    }

    static var allTests = [
        ("testAllCountries", testAllCountries),
        ("testAllCountriesWithStates", testAllCountriesWithStates),
        ("testInitWithIsoCode", testInitWithIsoCode)
    ]
}
