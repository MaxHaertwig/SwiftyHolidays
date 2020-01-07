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

    func testTriple() {
        XCTAssertEqual(Date(year: 2020, month: .march, day: 16).triple, DateTriple(year: 2020, month: 3, day: 16))
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

    static var allTests = [
        ("testInitYearMonthDay", testInitYearMonthDay),
        ("testYear", testYear),
        ("testTriple", testTriple),
        ("testEaster", testEaster)
    ]
}
