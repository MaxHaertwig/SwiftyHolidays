import Foundation

// https://en.wikipedia.org/wiki/Public_holidays_in_Luxembourg
final class Luxembourg: CountryBase {
    override class var iso2Code: String { "LU" }
    override class var iso3Code: String { "LUX" }

    override var defaultTimeZone: TimeZone { TimeZone(abbreviation: "CET")! }

    override func allHolidays(in year: Int) -> [Holiday] {
        guard year != 0 else { return [] }
        let easter = LocalDate.easter(in: year)
        return [
            Holiday(name: "Neijoerschdag", date: (year, .january, 1)),
            Holiday(name: "Ouschterméindeg", date: easter.addingDays(1)),
            Holiday(name: "Dag vun der Aarbecht", date: (year, .may, 1)),
            year >= 2019 ? Holiday(name: "Europadag", date: (year, .may, 9)) : nil,
            Holiday(name: "Christi Himmelfaart", date: easter.addingDays(39)),
            Holiday(name: "Péngschtméindeg", date: easter.addingDays(50)),
            Holiday(name: "Nationalfeierdag", date: (year, .june, 23)),
            Holiday(name: "Léiffrawëschdag", date: (year, .august, 15)),
            Holiday(name: "Allerhellgen", date: (year, .november, 1)),
            Holiday(name: "Chrëschtdag", date: (year, .december, 25)),
            Holiday(name: "Stiefesdag", date: (year, .december, 26))
        ].compactMap { $0 }
    }


}
