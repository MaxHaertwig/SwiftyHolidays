import Foundation

class HolidaysBuilder {
    let year: Int

    init(year: Int) {
        self.year = year
    }

    var holidays = [Holiday]()

    func addHoliday(_ name: String, date: LocalDate) {
        holidays.append(Holiday(name: name, date: date))
    }

    func addHoliday(_ name: String, date: (Month, Int)) {
        holidays.append(Holiday(name: name, date: (year, date.0, date.1)))
    }

    func getHolidays() -> [Holiday] {
        return holidays
    }
}
