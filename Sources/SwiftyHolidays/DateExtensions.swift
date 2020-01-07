import Foundation

public extension Date {
    func isHoliday(in country: Country) -> Bool {
        return getHoliday(in: country) != nil
    }

    func getHoliday(in country: Country) -> Holiday? {
        return country.model.getHoliday(self)
    }
}

extension Date {
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }

    var triple: (year: Int, month: Int, day: Int) {
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day], from: self)
        return (dateComponents.year!, dateComponents.month!, dateComponents.day!)
    }
}
