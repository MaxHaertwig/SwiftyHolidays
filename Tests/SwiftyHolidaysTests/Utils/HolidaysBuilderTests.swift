import XCTest
@testable import SwiftyHolidays

final class HolidaysBuilderTests: XCTestCase {
    func testInitWithYear() {
        let builder = HolidaysBuilder(year: 2020)
        XCTAssertEqual(builder.year, 2020)
    }

    func testAddHoliday() {
        let builder = HolidaysBuilder(year: 2020)
        builder.addHoliday("A", date: LocalDate(year: 2020, month: .march, day: 16))
        builder.addHoliday("B", date: (.july, 30))
        XCTAssertEqual(builder.getHolidays().count, 2)
        XCTAssertEqual(builder.getHolidays()[0], Holiday(name: "A", date: (2020, .march, 16)))
        XCTAssertEqual(builder.getHolidays()[1], Holiday(name: "B", date: (2020, .july, 30)))
    }

    static var allTests = [
        ("testInitWithYear", testInitWithYear),
        ("testAddHoliday", testAddHoliday)
    ]
}
