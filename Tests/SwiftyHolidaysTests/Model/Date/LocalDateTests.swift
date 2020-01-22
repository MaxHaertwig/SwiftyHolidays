import XCTest
@testable import SwiftyHolidays

final class LocalDateTests: XCTestCase {
    // MARK: Init

    func testInitWithYearMonthDay() {
        let date = LocalDate(year: 2020, month: 3, day: 16)
        XCTAssertEqual(date.year, 2020)
        XCTAssertEqual(date.month, 3)
        XCTAssertEqual(date.day, 16)
    }

    func testInitWithYearMonthEnumDay() {
        let date = LocalDate(year: 2020, month: .march, day: 16)
        XCTAssertEqual(date.year, 2020)
        XCTAssertEqual(date.month, 3)
        XCTAssertEqual(date.day, 16)
    }

    func testInitWithDateTimeZone() {
        let pst = TimeZone(abbreviation: "PST")!
        let cest = TimeZone(abbreviation: "CEST")!
        let dateComponents = DateComponents(year: 2020, month: 3, day: 16, hour: 20, minute: 0, second: 0)
        let date = Calendar(timeZone: pst).date(from: dateComponents)!
        XCTAssertEqual(LocalDate(date: date, timeZone: pst), LocalDate(year: 2020, month: 3, day: 16))
        XCTAssertEqual(LocalDate(date: date, timeZone: cest), LocalDate(year: 2020, month: 3, day: 17))
    }

    // MARK: Public

    func testIsHolidayInCountry() {
        let date = LocalDate(year: 2020, month: .october, day: 3)
        XCTAssert(date.isHoliday(in: .germany))
        XCTAssertFalse(date.isHoliday(in: .denmark))
    }

    func testGetHolidayInCountry() {
        let date = LocalDate(year: 2020, month: .october, day: 3)
        let holiday = date.getHoliday(in: .germany)
        XCTAssertNotNil(holiday)
        XCTAssertEqual(holiday!.name, "Tag der Deutschen Einheit")
        XCTAssertEqual(holiday!.date, date)
        XCTAssertNil(date.getHoliday(in: .denmark))
    }

    func testIsHolidayInCountryWithState() {
        let date = LocalDate(year: 2020, month: .november, day: 18)
        XCTAssert(date.isHoliday(in: .germany(state: .saxony)))
        XCTAssertFalse(date.isHoliday(in: .germany(state: .berlin)))
    }

    func testGetHolidayInCountryWithState() {
        let date = LocalDate(year: 2020, month: .november, day: 18)
        let holiday = date.getHoliday(in: .germany(state: .saxony))
        XCTAssertNotNil(holiday)
        XCTAssertEqual(holiday!.name, "Buß- und Bettag")
        XCTAssertEqual(holiday!.date, date)
        XCTAssertNil(date.getHoliday(in: .germany(state: .berlin)))
    }

    func testAsDate() {
        let localDate = LocalDate(year: 2020, month: .march, day: 16)
        let dateComponents = DateComponents(year: 2020, month: 3, day: 16)
        for timeZone in ["PST", "CEST", "IST"].map({ TimeZone(abbreviation: $0)! }) {
            XCTAssertEqual(Calendar(timeZone: timeZone).date(from: dateComponents)!, localDate.asDate(in: timeZone))
        }
    }

    // MARK: Internal

    func testWeekday() {
        XCTAssertEqual(LocalDate(year: 2020, month: .march, day: 16).weekday, .monday) // Monday
        XCTAssertEqual(LocalDate(year: 2020, month: .march, day: 21).weekday, .saturday) // Saturday
    }

    func testAddingDays() {
        let date = LocalDate(year: 2020, month: .march, day: 16)
        XCTAssertEqual(date.addingDays(0), date)
        XCTAssertEqual(date.addingDays(3), LocalDate(year: 2020, month: .march, day: 19))
        XCTAssertEqual(date.addingDays(-16), LocalDate(year: 2020, month: .february, day: 29))
    }

    func testPreviousWeekday() {
        let date = LocalDate(year: 2020, month: .march, day: 16)
        XCTAssertEqual(date.previous(.saturday), LocalDate(year: 2020, month: .march, day: 14))
        XCTAssertEqual(date.previous(.monday), LocalDate(year: 2020, month: .march, day: 9))
    }

    func testNextWeekday() {
        let date = LocalDate(year: 2020, month: .march, day: 16)
        XCTAssertEqual(date.next(.saturday), LocalDate(year: 2020, month: .march, day: 21))
        XCTAssertEqual(date.next(.monday), LocalDate(year: 2020, month: .march, day: 23))
    }

    func testEaster() {
        XCTAssertEqual(LocalDate.easter(in: 2000), LocalDate(year: 2000, month: .april, day: 23))
        XCTAssertEqual(LocalDate.easter(in: 2001), LocalDate(year: 2001, month: .april, day: 15))
        XCTAssertEqual(LocalDate.easter(in: 2002), LocalDate(year: 2002, month: .march, day: 31))
        XCTAssertEqual(LocalDate.easter(in: 2003), LocalDate(year: 2003, month: .april, day: 20))
        XCTAssertEqual(LocalDate.easter(in: 2004), LocalDate(year: 2004, month: .april, day: 11))
        XCTAssertEqual(LocalDate.easter(in: 2005), LocalDate(year: 2005, month: .march, day: 27))
        XCTAssertEqual(LocalDate.easter(in: 2006), LocalDate(year: 2006, month: .april, day: 16))
        XCTAssertEqual(LocalDate.easter(in: 2007), LocalDate(year: 2007, month: .april, day: 8))
        XCTAssertEqual(LocalDate.easter(in: 2008), LocalDate(year: 2008, month: .march, day: 23))
        XCTAssertEqual(LocalDate.easter(in: 2009), LocalDate(year: 2009, month: .april, day: 12))
    }

    static var allTests = [
        ("testInitWithYearMonthDay", testInitWithYearMonthDay),
        ("testInitWithYearMonthEnumDay", testInitWithYearMonthEnumDay),
        ("testInitWithDateTimeZone", testInitWithDateTimeZone),
        ("testIsHolidayInCountry", testIsHolidayInCountry),
        ("testGetHolidayInCountry", testGetHolidayInCountry),
        ("testIsHolidayInCountryWithState", testIsHolidayInCountryWithState),
        ("testGetHolidayInCountryWithState", testGetHolidayInCountryWithState),
        ("testAsDate", testAsDate),
        ("testWeekday", testWeekday),
        ("testAddingDays", testAddingDays),
        ("testPreviousWeekday", testPreviousWeekday),
        ("testNextWeekday", testNextWeekday),
        ("testEaster", testEaster)
    ]
}
