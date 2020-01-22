import Foundation

public extension Date {
    /// SwiftyHolidays: Returns true if there's a holiday at that date in a given country and time zone.
    ///
    /// - Parameters:
    ///   - country: Country to check for holidays in. Refer to `Country.availableCountries` for a list of available countries.
    ///   - timeZone: Time zone to interpret the date. If left unspecified, the default time zone for the given country will be used.
    func isHoliday(in country: Country, timeZone: TimeZone? = nil) -> Bool {
        return getHoliday(in: country, timeZone: timeZone) != nil
    }

    /// SwiftyHolidays: Returns a `Holiday` instance if the date is a holiday in a given country and time zone.
    ///
    /// - Parameters:
    ///   - country: Country to check for holidays in. Refer to `Country.availableCountries` for a list of available countries.
    ///   - timeZone: Time zone to interpret the date. If left unspecified, the default time zone for the given country will be used.
    func getHoliday(in country: Country, timeZone: TimeZone? = nil) -> Holiday? {
        return LocalDate(date: self, timeZone: timeZone ?? country.model.defaultTimeZone).getHoliday(in: country)
    }

    /// SwiftyHolidays: Returns true if there's a holiday at that date in a given country, state, and time zone.
    ///
    /// - Parameters:
    ///   - countryWithState: Country and state to check for holidays in. Refer to `Country.availableCountries` for a list of available countries.
    ///   - timeZone: Time zone to interpret the date. If left unspecified, the default time zone for the given country (or state) will be used.
    func isHoliday(in countryWithState: CountryWithState, timeZone: TimeZone? = nil) -> Bool {
        return getHoliday(in: countryWithState, timeZone: timeZone) != nil
    }

    /// SwiftyHolidays: Returns a `Holiday` instance if the date is a holiday in a given country, state, and time zone.
    ///
    /// - Parameters:
    ///   - countryWithState: Country and state to check for holidays in. Refer to `Country.availableCountries` for a list of available countries.
    ///   - timeZone: Time zone to interpret the date. If left unspecified, the default time zone for the given country (or state) will be used.
    func getHoliday(in countryWithState: CountryWithState, timeZone: TimeZone? = nil) -> Holiday? {
        let tz = timeZone ?? countryWithState.model.defaultTimeZone
        return LocalDate(date: self, timeZone: tz).getHoliday(in: countryWithState)
    }
}
