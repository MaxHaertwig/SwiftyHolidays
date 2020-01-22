import Foundation

protocol CountryProtocol {
    /// SwiftyHolidays: Returns all holidays in a given year.
    func allHolidays(in year: Int) -> [Holiday]
}

extension CountryProtocol {
    /// SwiftyHolidays: Returns all holidays in a given range of years.
    func allHolidays(in years: ClosedRange<Int>) -> [Holiday] {
        return years.reduce(into: []) { $0.append(contentsOf: allHolidays(in: $1)) }
    }
}
