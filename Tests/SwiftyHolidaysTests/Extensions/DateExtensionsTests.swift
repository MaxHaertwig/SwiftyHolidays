import XCTest
@testable import SwiftyHolidays

final class DateExtensionsTests: XCTestCase {
    func testInitYearMonthDay() {
        var dateComponents = DateComponents()
        dateComponents.year = 2020
        dateComponents.month = 3
        dateComponents.day = 16
        let date = Calendar.gregorianGMT.date(from: dateComponents)!
        XCTAssertEqual(Date(year: 2020, month: .march, day: 16), date)
    }

    func testYear() {
        XCTAssertEqual(Date(year: 2020, month: .march, day: 16).year, 2020)
    }

    func testWeekday() {
        XCTAssertEqual(Date(year: 2020, month: .march, day: 16).weekday, 2) // Monday
        XCTAssertEqual(Date(year: 2020, month: .march, day: 21).weekday, 7) // Saturday
    }

    func testTriple() {
        XCTAssertEqual(Date(year: 2020, month: .march, day: 16).triple, DateTriple(year: 2020, month: 3, day: 16))
    }

    func testTruncated() {
        var dateComponents = DateComponents()
        dateComponents.year = 2020
        dateComponents.month = 3
        dateComponents.day = 16
        dateComponents.hour = 6
        dateComponents.minute = 56
        dateComponents.second = 37
        let date = Calendar.gregorianGMT.date(from: dateComponents)!
        let truncatedComponents = Calendar.gregorianGMT.dateComponents([.hour, .minute, .second], from: date.truncated)
        XCTAssertEqual(truncatedComponents.hour, 0)
        XCTAssertEqual(truncatedComponents.minute, 0)
        XCTAssertEqual(truncatedComponents.second, 0)
    }

    func testAddingDays() {
        let date = Date(year: 2020, month: .march, day: 16)
        XCTAssertEqual(date.addingDays(0), date)
        XCTAssertEqual(date.addingDays(3), Date(year: 2020, month: .march, day: 19))
        XCTAssertEqual(date.addingDays(-16), Date(year: 2020, month: .february, day: 29))
    }

    func testEaster() {
        XCTAssertEqual(Date.easter(year: 2000), Date(year: 2000, month: .april, day: 23))
        XCTAssertEqual(Date.easter(year: 2001), Date(year: 2001, month: .april, day: 15))
        XCTAssertEqual(Date.easter(year: 2002), Date(year: 2002, month: .march, day: 31))
        XCTAssertEqual(Date.easter(year: 2003), Date(year: 2003, month: .april, day: 20))
        XCTAssertEqual(Date.easter(year: 2004), Date(year: 2004, month: .april, day: 11))
        XCTAssertEqual(Date.easter(year: 2005), Date(year: 2005, month: .march, day: 27))
        XCTAssertEqual(Date.easter(year: 2006), Date(year: 2006, month: .april, day: 16))
        XCTAssertEqual(Date.easter(year: 2007), Date(year: 2007, month: .april, day: 8))
        XCTAssertEqual(Date.easter(year: 2008), Date(year: 2008, month: .march, day: 23))
        XCTAssertEqual(Date.easter(year: 2009), Date(year: 2009, month: .april, day: 12))
    }

    func testDateOfWeekdayBeforeDate() {
        let date = Date(year: 2020, month: .march, day: 16)
        XCTAssertEqual(Date.date(of: .saturday, before: date), Date(year: 2020, month: .march, day: 14))
        XCTAssertEqual(Date.date(of: .monday, before: date), Date(year: 2020, month: .march, day: 9))
    }

    func testDateOfWeekdayAfterDate() {
        let date = Date(year: 2020, month: .march, day: 16)
        XCTAssertEqual(Date.date(of: .saturday, after: date), Date(year: 2020, month: .march, day: 21))
        XCTAssertEqual(Date.date(of: .monday, after: date), Date(year: 2020, month: .march, day: 23))
    }

    func testFirstWeekdayOfMonthInYear() {
        XCTAssertEqual(Date.first(.wednesday, of: .january, in: 2020), Date(year: 2020, month: .january, day: 1))
        XCTAssertEqual(Date.first(.tuesday, of: .january, in: 2020), Date(year: 2020, month: .january, day: 7))
    }

    func testLastWeekdayOfMonthInYear() {
        XCTAssertEqual(Date.last(.saturday, of: .january, in: 2020), Date(year: 2020, month: .january, day: 25))
        XCTAssertEqual(Date.last(.friday, of: .january, in: 2020), Date(year: 2020, month: .january, day: 31))
    }

    func testCalculateOrdinalWeekdayOfMonthInYear() {
        XCTAssertEqual(Date.calculate(.first, .tuesday, of: .january, in: 2020), Date.first(.tuesday, of: .january, in: 2020))
        XCTAssertEqual(Date.calculate(.second, .thursday, of: .february, in: 2020), Date(year: 2020, month: .february, day: 13))
        XCTAssertEqual(Date.calculate(.fourth, .sunday, of: .july, in: 2020), Date(year: 2020, month: .july, day: 26))
    }

    static var allTests = [
        ("testInitYearMonthDay", testInitYearMonthDay),
        ("testYear", testYear),
        ("testWeekday", testWeekday),
        ("testTruncated", testTruncated),
        ("testTriple", testTriple),
        ("testAddingDays", testAddingDays),
        ("testEaster", testEaster),
        ("testDateOfWeekdayBeforeDate", testDateOfWeekdayBeforeDate),
        ("testDateOfWeekdayAfterDate", testDateOfWeekdayAfterDate),
        ("testFirstWeekdayOfMonthInYear", testFirstWeekdayOfMonthInYear),
        ("testLastWeekdayOfMonthInYear", testLastWeekdayOfMonthInYear),
        ("testCalculateOrdinalWeekdayOfMonthInYear", testCalculateOrdinalWeekdayOfMonthInYear)
    ]
}
