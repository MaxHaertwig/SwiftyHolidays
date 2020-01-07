import Foundation

protocol HolidayEntity {
    var allHolidays: [Holiday] { get }
}

extension HolidayEntity {
    func getHoliday(_ date: Date) -> Holiday? {
        return allHolidays.first { $0.date.triple == date.triple }
    }
}
