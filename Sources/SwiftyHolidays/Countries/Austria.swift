import Foundation

// https://de.wikipedia.org/wiki/Feiertage_in_Österreich
final class Austria: CountryWithStateBase<AustrianState> {
    override class var iso2Code: String { "AT" }
    override class var iso3Code: String { "AUT" }

    override var defaultTimeZone: TimeZone { TimeZone(abbreviation: "CET")! }

    override func allHolidays(in year: Int) -> [Holiday] {
        guard year >= 1945 else { return [] }
        let easter = LocalDate.easter(in: year)
        return [
            Holiday(name: "Neujahr", date: (year, .january, 1)),
            Holiday(name: "Heilige Drei Könige", date: (year, .january, 6)),
            Holiday(name: "Ostermontag", date: easter.addingDays(1)),
            Holiday(name: "Staatsfeiertag", date: (year, .may, 1)),
            Holiday(name: "Christi Himmelfahrt", date: easter.addingDays(39)),
            Holiday(name: "Pfingstmontag", date: easter.addingDays(50)),
            Holiday(name: "Fronleichnam", date: easter.addingDays(60)),
            Holiday(name: "Mariä Himmelfahrt", date: (year, .august, 15)),
            year >= 1967 ? Holiday(name: "Nationalfeiertag", date: (year, .october, 26)) : nil,
            Holiday(name: "Allerheiligen", date: (year, .november, 1)),
            Holiday(name: "Mariä Empfängnis", date: (year, .december, 8)),
            Holiday(name: "Christtag", date: (year, .december, 25)),
            Holiday(name: "Stefanitag", date: (year, .december, 26))
        ].compactMap { $0 }
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
