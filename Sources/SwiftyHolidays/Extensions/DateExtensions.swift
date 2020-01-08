import Foundation

public extension Date {
    func isHoliday(in country: Country) -> Bool {
        return getHoliday(in: country) != nil
    }

    func getHoliday(in country: Country) -> Holiday? {
        return country.getHoliday(self)
    }

    func isHoliday(in country: CountryWithState) -> Bool {
        return getHoliday(in: country) != nil
    }

    func getHoliday(in country: CountryWithState) -> Holiday? {
        return country.getHoliday(self)
    }
}

extension Date {
    init(year: Int, month: Month, day: Int) {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month.rawValue
        dateComponents.day = day
        self.init(timeIntervalSince1970: Calendar.gregorianGMT.date(from: dateComponents)!.timeIntervalSince1970)
    }

    var year: Int {
        return Calendar.gregorianGMT.component(.year, from: self)
    }

    var weekday: Int {
        return Calendar.gregorianGMT.component(.weekday, from: self)
    }

    var triple: DateTriple {
        let dateComponents = Calendar.gregorianGMT.dateComponents([.year, .month, .day], from: self)
        return DateTriple(year: dateComponents.year!, month: dateComponents.month!, day: dateComponents.day!)
    }

    var truncated: Date {
        let dateComponents = Calendar.gregorianGMT.dateComponents([.year, .month, .day], from: self)
        return Calendar.gregorianGMT.date(from: dateComponents)!
    }

    func addingDays(_ days: Int) -> Date {
        return addingTimeInterval(TimeInterval(days) * 24 * 60 * 60)
    }

    // swiftlint:disable identifier_name
    static func easter(year: Int) -> Date {
        let a = year % 19
        let b = Int(floor(Double(year) / 100))
        let c = year % 100
        let d = Int(floor(Double(b) / 4))
        let e = b % 4
        let f = Int(floor(Double(b+8) / 25))
        let g = Int(floor(Double(b-f+1) / 3))
        let h = (19*a + b - d - g + 15) % 30
        let i = Int(floor(Double(c) / 4))
        let k = c % 4
        let L = (32 + 2*e + 2*i - h - k) % 7
        let m = Int(floor(Double(a + 11*h + 22*L) / 451))
        var components = DateComponents()
        components.year = year
        components.month = Int(floor(Double(h + L - 7*m + 114) / 31))
        components.day = ((h + L - 7*m + 114) % 31) + 1
        return Calendar.gregorianGMT.date(from: components)!
    }
    // swiftlint:enable identifier_name

    static func date(of weekday: Weekday, before date: Date) -> Date {
        var day = date.truncated.addingDays(-1)
        while day.weekday != weekday.rawValue {
            day = day.addingDays(-1)
        }
        return day
    }

    static func date(of weekday: Weekday, after date: Date) -> Date {
        var day = date.truncated.addingDays(1)
        while day.weekday != weekday.rawValue {
            day = day.addingDays(1)
        }
        return day
    }

    enum WeekdayInMonthOrdinal: Int {
        case first, second, third, fourth
    }

    static func first(_ weekday: Weekday, of month: Month, in year: Int) -> Date {
        var date = month.firstDay(in: year)
        while date.weekday != weekday.rawValue {
            date = date.addingDays(1)
        }
        return date
    }

    static func last(_ weekday: Weekday, of month: Month, in year: Int) -> Date {
        var date = month.lastDay(in: year)
        while date.weekday != weekday.rawValue {
            date = date.addingDays(-1)
        }
        return date
    }

    static func calculate(_ ordinal: WeekdayInMonthOrdinal, _ weekday: Weekday, of month: Month, in year: Int) -> Date {
        return first(weekday, of: month, in: year).addingDays(ordinal.rawValue * 7)
    }

}
