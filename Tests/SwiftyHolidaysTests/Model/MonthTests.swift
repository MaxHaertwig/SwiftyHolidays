import XCTest
@testable import SwiftyHolidays

final class MonthTests: XCTestCase {
    func testLength() {
        for month in Month.allCases {
            let length = month.length(in: 2019)
            XCTAssert(length >= 28 && length <= 31)
        }
        XCTAssertEqual(Month.february.length(in: 2019), 28)
        XCTAssertEqual(Month.february.length(in: 2020), 29)
    }

    func testFirstDay() {
        for month in Month.allCases {
            XCTAssertEqual(month.firstDay(in: 2020), Date(year: 2020, month: month, day: 1))
        }
    }

    func testLastDay() {
        XCTAssertEqual(Month.january.lastDay(in: 2020), Date(year: 2020, month: .january, day: 31))
        XCTAssertEqual(Month.february.lastDay(in: 2020), Date(year: 2020, month: .february, day: 29))
    }

    static var allTests = [
        ("testLength", testLength),
        ("testFirstDay", testFirstDay),
        ("testLastDay", testLastDay)
    ]
}
