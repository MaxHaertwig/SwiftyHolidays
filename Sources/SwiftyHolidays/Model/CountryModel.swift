import Foundation

protocol CountryModel: HolidayEntity {
    var iso2Code: String { get }
    var iso3Code: String { get }
}
