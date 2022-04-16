import XCTest
@testable import SwiftyHolidays

final class CountriesTests: XCTestCase {
    func testIsoCodes() {
        for countryType in Country.countryTypes {
            XCTAssertEqual(countryType.iso2Code.count, 2)
            XCTAssertEqual(countryType.iso2Code, countryType.iso2Code.uppercased())
            XCTAssertEqual(countryType.iso3Code.count, 3)
            XCTAssertEqual(countryType.iso3Code, countryType.iso3Code.uppercased())
        }
    }

    func testNumberOfStates() {
        XCTAssertEqual(AustrianState.allCases.count, 9)
        XCTAssertEqual(FrenchDepartment.allCases.count, 95 + 2) // separated departments: Corse, Lyon
        XCTAssertEqual(GermanState.allCases.count, 16)
        XCTAssertEqual(SpanishCommunity.allCases.count, 17 + 2) // autonomous cities: Ceuta, Melilla
        XCTAssertEqual(SwissCanton.allCases.count, 26)
        XCTAssertEqual(USState.allCases.count, 50)
        XCTAssertEqual(ItalianRegion.allCases.count, 20)
    }

    static var allTests = [
        ("testIsoCodes", testIsoCodes),
        ("testNumberOfStates", testNumberOfStates)
    ]
}
