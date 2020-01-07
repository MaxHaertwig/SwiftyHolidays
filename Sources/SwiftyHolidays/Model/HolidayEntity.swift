import Foundation

protocol HolidayEntity {
    func allHolidays(year: Int) -> [Holiday]
}

extension HolidayEntity {
    func allHolidays(years: ClosedRange<Int>) -> [Holiday] {
        return years.reduce(into: [Holiday]()) { $0.append(contentsOf: allHolidays(year: $1)) }
    }

    func getHoliday(_ date: Date) -> Holiday? {
        return allHolidays(year: date.year).first { $0.date.triple == date.triple }
    }
}
