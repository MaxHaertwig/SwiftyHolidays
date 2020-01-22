import XCTest
@testable import SwiftyHolidays

final class CalendarExtensionsTests: XCTestCase {
    func testInitWithTimeZone() {
        let timeZone = TimeZone(abbreviation: "PST")!
        XCTAssertEqual(Calendar(timeZone: timeZone).timeZone, timeZone)
    }

    static var allTests = [
        ("testInitWithTimeZone", testInitWithTimeZone)
    ]
}
