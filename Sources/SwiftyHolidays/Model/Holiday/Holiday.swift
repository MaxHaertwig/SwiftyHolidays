import Foundation

/// SwiftyHolidays: Refresents a specific holiday on a single day.
public struct Holiday: Equatable {
    /// SwiftyHolidays: The name of the holiday.
    public let name: String

    /// SwiftyHolidays: The date of the holiday without information about the time of day.
    public let date: LocalDate

    init(name: String, date: LocalDate) {
        self.name = name
        self.date = date
    }

    init(name: String, date: (Int, Month, Int)) {
        self.name = name
        self.date = LocalDate(year: date.0, month: date.1, day: date.2)!
    }
}
