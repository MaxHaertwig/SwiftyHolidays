import XCTest
@testable import SwiftyHolidays

final class DateExtensionsTests: XCTestCase {
    func testIsHolidayInCountry() {
        let october3 = LocalDate(year: 2020, month: .october, day: 3)
        XCTAssert(october3.isHoliday(in: .germany))
        XCTAssertFalse(october3.isHoliday(in: .denmark))
    }
    
//    private func newDate(year: Int, month: Month, day: Int) -> Date {
//        let dateComponents = DateComponents(year: year, month: month.rawValue, day: day)
//        return Calendar(timeZone: Germany.defaultTimeZone).date(from: dateComponents)!
//    }

//    static var allTests = [
//        ("testInitWithTimeZone", testInitWithTimeZone)
//    ]
}
