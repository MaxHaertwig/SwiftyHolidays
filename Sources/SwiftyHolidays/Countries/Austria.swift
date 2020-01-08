import Foundation

// https://de.wikipedia.org/wiki/Feiertage_in_Österreich
final class Austria: CountryBase<AustrianState> {
    override var iso2Code: String { "AT" }
    override var iso3Code: String { "AUT" }

    override func allHolidays(year: Int) -> [Holiday] {
        guard year >= 1945 else { return [] }

        var holidays = [Holiday]()

        func addHoliday(_ name: String, month: Month, day: Int) {
            holidays.append(Holiday(name: name, date: Date(year: year, month: month, day: day)))
        }
        func addHoliday(_ name: String, date: Date) {
            holidays.append(Holiday(name: name, date: date))
        }

        addHoliday("Neujahr", month: .january, day: 1)

        addHoliday("Heilige Drei Könige", month: .january, day: 6)

        let easter = Date.easter(year: year)

        addHoliday("Ostermontag", date: easter.addingDays(1))

        addHoliday("Staatsfeiertag", month: .may, day: 1)

        addHoliday("Christi Himmelfahrt", date: easter.addingDays(39))

        addHoliday("Pfingstmontag", date: easter.addingDays(50))

        addHoliday("Fronleichnam", date: easter.addingDays(60))

        addHoliday("Mariä Himmelfahrt", month: .august, day: 15)

        if year >= 1967 {
            addHoliday("Nationalfeiertag", month: .october, day: 26)
        }

        addHoliday("Allerheiligen", month: .november, day: 1)

        addHoliday("Mariä Empfängnis", month: .december, day: 8)

        addHoliday("Christtag", month: .december, day: 25)

        addHoliday("Stefanitag", month: .december, day: 26)

        return holidays
    }
}

public enum AustrianState: CaseIterable {
    case burgenland
    case karnten
    case niederosterreich
    case oberosterreich
    case salzburg
    case steiermark
    case tirol
    case vorarlberg
    case wien
}
