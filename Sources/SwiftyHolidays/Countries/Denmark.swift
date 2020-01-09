import Foundation

struct Denmark: CountryModel {
    var iso2Code: String { "DK" }
    var iso3Code: String { "DNK" }

    func allHolidays(year: Int) -> [Holiday] {
        let easter = Date.easter(year: year)
        return [
            Holiday(name: "Nytårsdag", date: Date(year: year, month: .january, day: 1)),
            Holiday(name: "Palmesøndag", date: easter.addingDays(-7)),
            Holiday(name: "Skærtorsdag", date: easter.addingDays(-3)),
            Holiday(name: "Langfredag", date: easter.addingDays(-2)),
            Holiday(name: "Påskedag", date: easter),
            Holiday(name: "Anden Påskedag", date: easter.addingDays(1)),
            Holiday(name: "Store Bededag", date: easter.addingDays(26)),
            Holiday(name: "Kristi Himmelfartsdag", date: easter.addingDays(40)),
            Holiday(name: "Pinsedag", date: easter.addingDays(49)),
            Holiday(name: "Anden Pinsedag", date: easter.addingDays(50)),
            Holiday(name: "Juledag", date: Date(year: year, month: .december, day: 25)),
            Holiday(name: "Anden Juledag", date:Date(year: year, month: .december, day: 26))
        ]
    }
}
