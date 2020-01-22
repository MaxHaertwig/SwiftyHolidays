import Foundation

// https://en.wikipedia.org/wiki/Public_holidays_in_Denmark
final class Denmark: CountryBase {
    override class var iso2Code: String { "DK" }
    override class var iso3Code: String { "DNK" }

    override var defaultTimeZone: TimeZone { TimeZone(abbreviation: "CET")! }

    override func allHolidays(in year: Int) -> [Holiday] {
        let easter = LocalDate.easter(in: year)
        return [
            Holiday(name: "Nytårsdag", date: (year, .january, 1)),
            Holiday(name: "Palmesøndag", date: easter.addingDays(-7)),
            Holiday(name: "Skærtorsdag", date: easter.addingDays(-3)),
            Holiday(name: "Langfredag", date: easter.addingDays(-2)),
            Holiday(name: "Påskedag", date: easter),
            Holiday(name: "Anden Påskedag", date: easter.addingDays(1)),
            Holiday(name: "Store Bededag", date: easter.addingDays(26)),
            Holiday(name: "Kristi Himmelfartsdag", date: easter.addingDays(40)),
            Holiday(name: "Pinsedag", date: easter.addingDays(49)),
            Holiday(name: "Anden Pinsedag", date: easter.addingDays(50)),
            Holiday(name: "Juledag", date: (year, .december, 25)),
            Holiday(name: "Anden Juledag", date: (year, .december, 26))
        ]
    }
}
