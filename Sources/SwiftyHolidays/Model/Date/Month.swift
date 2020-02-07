import Foundation

/// SwiftyHolidays: Represents a month in the Gregorian calendar.
public enum Month: Int, CaseIterable {
    case january = 1
    case february = 2
    case march = 3
    case april = 4
    case may = 5
    case june = 6
    case july = 7
    case august = 8
    case september = 9
    case october = 10
    case november = 11
    case december = 12

    func length(in year: Int) -> Int {
        switch self {
        case .january, .march, .may, .july, .august, .october, .december:
            return 31
        case .february:
            return year % 4 == 0 ? 29 : 28
        default:
            return 30
        }
    }

    func firstDay(in year: Int) -> LocalDate {
        return LocalDate(year: year, month: self, day: 1)!
    }

    func lastDay(in year: Int) -> LocalDate {
        return LocalDate(year: year, month: self, day: length(in: year))!
    }

    enum WeekdayInMonthOrdinal: Int {
        case first, second, third, fourth
    }

    func first(_ weekday: Weekday, in year: Int) -> LocalDate {
        var date = firstDay(in: year)
        while date.weekday != weekday {
            date = date.addingDays(1)
        }
        return date
    }

    func last(_ weekday: Weekday, in year: Int) -> LocalDate {
        var date = lastDay(in: year)
        while date.weekday != weekday {
            date = date.addingDays(-1)
        }
        return date
    }

    func get(_ ordinal: WeekdayInMonthOrdinal, _ weekday: Weekday, in year: Int) -> LocalDate {
        return first(weekday, in: year).addingDays(ordinal.rawValue * 7)
    }
}
