import Foundation

// https://de.wikipedia.org/wiki/Feiertage_in_Österreich
final class Austria: CountryBase<AustrianState> {
    override var iso2Code: String { "AT" }
    override var iso3Code: String { "AUT" }

    override func allHolidays(year: Int) -> [Holiday] {
        guard year >= 1945 else { return [] }
        let easter = Date.easter(year: year)
        return [
            Holiday(name: "Neujahr", date: Date(year: year, month: .january, day: 1)),
            Holiday(name: "Heilige Drei Könige", date: Date(year: year, month: .january, day: 6)),
            Holiday(name: "Ostermontag", date: easter.addingDays(1)),
            Holiday(name: "Staatsfeiertag", date: Date(year: year, month: .may, day: 1)),
            Holiday(name: "Christi Himmelfahrt", date: easter.addingDays(39)),
            Holiday(name: "Pfingstmontag", date: easter.addingDays(50)),
            Holiday(name: "Fronleichnam", date: easter.addingDays(60)),
            Holiday(name: "Mariä Himmelfahrt", date: Date(year: year, month: .august, day: 15)),
            year >= 1967 ? Holiday(name: "Nationalfeiertag", date: Date(year: year, month: .october, day: 26)) : nil,
            Holiday(name: "Allerheiligen", date: Date(year: year, month: .november, day: 1)),
            Holiday(name: "Mariä Empfängnis", date: Date(year: year, month: .december, day: 8)),
            Holiday(name: "Christtag", date: Date(year: year, month: .december, day: 25)),
            Holiday(name: "Stefanitag", date: Date(year: year, month: .december, day: 26))
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
