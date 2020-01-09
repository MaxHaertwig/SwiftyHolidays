import Foundation

// https://en.wikipedia.org/wiki/Public_holidays_in_Luxembourg
struct Luxembourg: CountryModel {
    var iso2Code: String { "LU" }
    var iso3Code: String { "LUX" }

    func allHolidays(year: Int) -> [Holiday] {
        let easter = Date.easter(year: year)
        return [
            Holiday(name: "Neijoerschdag", date: Date(year: year, month: .january, day: 1)),
            Holiday(name: "Ouschterméindeg", date: easter.addingDays(1)),
            Holiday(name: "Dag vun der Aarbecht", date: Date(year: year, month: .may, day: 1)),
            year >= 2019 ? Holiday(name: "Europadag", date: Date(year: year, month: .may, day: 9)) : nil,
            Holiday(name: "Christi Himmelfaart", date: easter.addingDays(39)),
            Holiday(name: "Péngschtméindeg", date: easter.addingDays(50)),
            Holiday(name: "Nationalfeierdag", date: Date(year: year, month: .june, day: 23)),
            Holiday(name: "Léiffrawëschdag", date: Date(year: year, month: .august, day: 15)),
            Holiday(name: "Allerhellgen", date: Date(year: year, month: .november, day: 1)),
            Holiday(name: "Chrëschtdag", date: Date(year: year, month: .december, day: 25)),
            Holiday(name: "Stiefesdag", date: Date(year: year, month: .december, day: 26))
        ].compactMap { $0 }
    }


}
