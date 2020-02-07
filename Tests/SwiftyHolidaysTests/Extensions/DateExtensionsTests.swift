import XCTest
@testable import SwiftyHolidays

final class DateExtensionsTests: XCTestCase {
    func testAsDate() {
        let pst = TimeZone(abbreviation: "PST")!
        let cet = TimeZone(abbreviation: "CET")!
        let dateComponents = DateComponents(year: 2020, month: 3, day: 16, hour: 0, minute: 0, second: 0)
        let date = Calendar(timeZone: cet).date(from: dateComponents)!
        XCTAssertEqual(date.asLocalDate(in: cet), LocalDate(year: 2020, month: .march, day: 16))
        XCTAssertEqual(date.asLocalDate(in: pst), LocalDate(year: 2020, month: .march, day: 15))
    }

    static var allTests = [
        ("testAsDate", testAsDate)
    ]
}
