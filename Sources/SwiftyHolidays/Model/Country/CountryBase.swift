import Foundation

class CountryBase: CountryProtocol {
    class var iso2Code: String { "" }
    class var iso3Code: String { "" }

    var defaultTimeZone: TimeZone { TimeZone(secondsFromGMT: 0)! }

    func allHolidays(in year: Int) -> [Holiday] {
        return []
    }

    func buildHolidays(year: Int, closure: (HolidaysBuilder) -> Void) -> [Holiday] {
        let builder = HolidaysBuilder(year: year)
        closure(builder)
        return builder.getHolidays()
    }
}
