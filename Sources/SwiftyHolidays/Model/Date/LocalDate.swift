import Foundation

/// SwiftyHolidays: Represents a date as a triple of year, month, and day.
public struct LocalDate: Equatable {
    let year, month, day: Int

    // MARK: Init

    /// SwiftyHolidays: Initializes an instance of `LocalDate`. Returns nil if the resulting date is invalid.
    public init?(year: Int, month: Int, day: Int) {
        guard let monthObj = Month(rawValue: month), year != 0 && 1...monthObj.length(in: year) ~= day
            else { return nil }
        self.year = year
        self.month = month
        self.day = day
    }

    /// SwiftyHolidays: Initializes an instance of `LocalDate`. Returns nil if the resulting date is invalid.
    public init?(year: Int, month: Month, day: Int) {
        guard year != 0 && 1...month.length(in: year) ~= day else { return nil }
        self.year = year
        self.month = month.rawValue
        self.day = day
    }

    /// SwiftyHolidays: Initializes an instance of `LocalDate`.
    ///
    /// - Parameters:
    ///   - date: A date with time information.
    ///   - timeZone: A time zone to interpret the date.
    public init(date: Date, timeZone: TimeZone) {
        let dateComponents = Calendar(timeZone: timeZone).dateComponents([.year, .month, .day], from: date)
        self.year = dateComponents.year!
        self.month = dateComponents.month!
        self.day = dateComponents.day!
    }

    // MARK: Public

    /// SwiftyHolidays: Returns `true` if the date is a holiday in the given country.
    public func isHoliday(in country: Country) -> Bool {
        return getHoliday(in: country) != nil
    }

    /// SwiftyHolidays: Returns a `Holiday` instance if the date is a holiday in the given country and state.
    public func getHoliday(in country: Country) -> Holiday? {
        return country.allHolidays(in: year).first { $0.date == self }
    }

    /// SwiftyHolidays: Returns `true` if the date is a holiday in the given country.
    public func isHoliday(in countryWithState: CountryWithState) -> Bool {
        return getHoliday(in: countryWithState) != nil
    }

    /// SwiftyHolidays: Returns a `Holiday` instance if the date is a holiday in the given country and state.
    public func getHoliday(in countryWithState: CountryWithState) -> Holiday? {
        return countryWithState.allHolidays(in: year).first { $0.date == self }
    }

    /// SwiftyHolidays: Converts the `LocalDate` to a `Date`.
    ///
    /// - Parameters:
    ///   - timeZone: Time zone to interpret the date.
    public func asDate(in timeZone: TimeZone) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        return Calendar(timeZone: timeZone).date(from: dateComponents)!
    }

    // MARK: Internal

    var weekday: Weekday {
        let gmt = TimeZone(secondsFromGMT: 0)!
        let date = asDate(in: gmt)
        let dateWeekday = Calendar(timeZone: gmt).component(.weekday, from: date)
        return Weekday(rawValue: dateWeekday)!
    }

    func addingDays(_ days: Int) -> LocalDate {
        var newDay = day + days
        var newMonth = month
        var newYear = year
        while let month = Month(rawValue: newMonth), newDay > month.length(in: year) {
            newDay -= month.length(in: year)
            if month == .december {
                newMonth = 1
                newYear += 1
            } else {
                newMonth += 1
            }
        }
        while newDay < 1 {
            if newMonth == 1 {
                newMonth = 12
                newYear -= 1
            } else {
                newMonth -= 1
            }
            newDay += Month(rawValue: newMonth)!.length(in: year)
        }
        return LocalDate(year: newYear, month: newMonth, day: newDay)!
    }

    func previous(_ weekday: Weekday) -> LocalDate {
        var day = addingDays(-1)
        while day.weekday != weekday {
            day = day.addingDays(-1)
        }
        return day
    }

    func next(_ weekday: Weekday) -> LocalDate {
        var day = addingDays(1)
        while day.weekday != weekday {
            day = day.addingDays(1)
        }
        return day
    }

    // swiftlint:disable identifier_name
    static func easter(in year: Int) -> LocalDate {
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

        let month = Int(floor(Double(h + L - 7*m + 114) / 31))
        let day = ((h + L - 7*m + 114) % 31) + 1
        return LocalDate(year: year, month: month, day: day)!
    }
    // swiftlint:enable identifier_name
}
