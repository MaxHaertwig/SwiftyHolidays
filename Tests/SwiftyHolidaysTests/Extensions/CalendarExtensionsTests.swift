import XCTest
@testable import SwiftyHolidays

final class CalendarExtensionsTests: XCTestCase {
    func testGregorianGMT() {
        let calendar = Calendar.gregorianGMT
        XCTAssertEqual(calendar.identifier, Calendar.Identifier.gregorian)
        XCTAssertEqual(calendar.timeZone.secondsFromGMT(), 0)
    }

    static var allTests = [
        ("testGregorianGMT", testGregorianGMT)
    ]
}
