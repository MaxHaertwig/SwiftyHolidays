import XCTest
@testable import SwiftyHolidays

final class MonthTests: XCTestCase {
    func testLengthInYear() {
        for month in Month.allCases {
            let length = month.length(in: 2019)
            XCTAssert(length >= 28 && length <= 31)
        }
        XCTAssertEqual(Month.february.length(in: 2019), 28)
        XCTAssertEqual(Month.february.length(in: 2020), 29)
    }

    func testFirstDayInYear() {
        for month in Month.allCases {
            XCTAssertEqual(month.firstDay(in: 2020), LocalDate(year: 2020, month: month, day: 1))
        }
    }

    func testLastDayInYear() {
        XCTAssertEqual(Month.january.lastDay(in: 2020), LocalDate(year: 2020, month: .january, day: 31))
        XCTAssertEqual(Month.february.lastDay(in: 2020), LocalDate(year: 2020, month: .february, day: 29))
    }

    func testFirstWeekdayInYear() {
        XCTAssertEqual(Month.january.first(.wednesday, in: 2020), LocalDate(year: 2020, month: .january, day: 1))
        XCTAssertEqual(Month.january.first(.tuesday, in: 2020), LocalDate(year: 2020, month: .january, day: 7))
    }

    func testLastWeekdayInYear() {
        XCTAssertEqual(Month.january.last(.saturday, in: 2020), LocalDate(year: 2020, month: .january, day: 25))
        XCTAssertEqual(Month.january.last(.friday, in: 2020), LocalDate(year: 2020, month: .january, day: 31))
    }

    func testGetOrdinalWeekdayOfMonthInYear() {
        XCTAssertEqual(Month.january.get(.first, .tuesday, in: 2020), Month.january.first(.tuesday, in: 2020))
        XCTAssertEqual(Month.february.get(.second, .thursday, in: 2020), LocalDate(year: 2020, month: .february,
            day: 13))
        XCTAssertEqual(Month.july.get(.fourth, .sunday, in: 2020), LocalDate(year: 2020, month: .july, day: 26))
    }

    static var allTests = [
        ("testLengthInYear", testLengthInYear),
        ("testFirstDayInYear", testFirstDayInYear),
        ("testLastDayInYear", testLastDayInYear),
        ("testFirstWeekdayInYear", testFirstWeekdayInYear),
        ("testLastWeekdayInYear", testLastWeekdayInYear),
        ("testGetOrdinalWeekdayOfMonthInYear", testGetOrdinalWeekdayOfMonthInYear)
    ]
}
