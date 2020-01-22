import XCTest
@testable import SwiftyHolidays

final class HolidaysBuilderUSTests: XCTestCase {
    func testAddOptionalHoliday() {
        let holiday = Holiday(name: "A", date: (2020, .march, 16))
        let builder = HolidaysBuilderUS(year: 2020)
        builder.addHoliday(nil)
        builder.addHoliday(holiday)
        XCTAssertEqual(builder.getHolidays().count, 1)
        XCTAssertEqual(builder.getHolidays()[0], holiday)
    }

    func testAddHolidayCheckObservance() {
        let builder = HolidaysBuilderUS(year: 2020)
        builder.addHoliday("A", date: (.march, 15), checkObservance: true)
        XCTAssertEqual(builder.getHolidays().count, 2)
        XCTAssertEqual(builder.getHolidays()[0], Holiday(name: "A", date: (2020, .march, 15)))
        XCTAssertEqual(builder.getHolidays()[1], Holiday(name: "A (observed)", date: (2020, .march, 16)))
    }

    func testObservedHoliday() {
        let saturday = Holiday(name: "A", date: (2020, .march, 14))
        let saturdayObserved = Holiday(name: "A (observed)", date: (2020, .march, 13))
        XCTAssertEqual(HolidaysBuilderUS.observedHoliday(of: saturday), saturdayObserved)
        let sunday = Holiday(name: "B", date: (2020, .march, 15))
        let sundayObserved = Holiday(name: "B (observed)", date: (2020, .march, 16))
        XCTAssertEqual(HolidaysBuilderUS.observedHoliday(of: sunday), sundayObserved)
    }

    static var allTests = [
        ("testAddOptionalHoliday", testAddOptionalHoliday),
        ("testAddHolidayCheckObservance", testAddHolidayCheckObservance),
        ("testObservedHoliday", testObservedHoliday)
    ]
}
