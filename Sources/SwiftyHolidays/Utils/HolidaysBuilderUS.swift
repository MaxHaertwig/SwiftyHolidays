import Foundation

final class HolidaysBuilderUS: HolidaysBuilder {
    func addHoliday(_ holiday: Holiday?) {
        if let holiday = holiday {
            holidays.append(holiday)
        }
    }

    func addHoliday(tuple: (holiday: Holiday, checkObservance: Bool)?) {
        if let tuple = tuple {
            holidays.append(tuple.holiday)
            if tuple.checkObservance, let observedHoliday = Self.observedHoliday(of: tuple.holiday) {
                holidays.append(observedHoliday)
            }
        }
    }

    func addHoliday(_ name: String, date: (Month, Int), checkObservance: Bool = false) {
        let holiday = Holiday(name: name, date: (year, date.0, date.1))
        holidays.append(holiday)
        if checkObservance, let observedHolday = Self.observedHoliday(of: holiday) {
            holidays.append(observedHolday)
        }
    }

    static func observedHoliday(of holiday: Holiday) -> Holiday? {
        if holiday.date.weekday == Weekday.saturday {
            return Holiday(name: holiday.name + " (observed)", date: holiday.date.addingDays(-1))
        }
        if holiday.date.weekday == Weekday.sunday {
            return Holiday(name: holiday.name + " (observed)", date: holiday.date.addingDays(1))
        }
        return nil
    }
}
