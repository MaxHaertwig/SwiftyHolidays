import Foundation

// https://de.wikipedia.org/wiki/Gesetzliche_Feiertage_in_Deutschland
final class Germany: CountryBase<GermanState> {

    override var iso2Code: String { "DE" }
    override var iso3Code: String { "DEU" }

    override func allHolidays(year: Int) -> [Holiday] {
        guard year >= 1989 else { return [] }

        var holidays = [Holiday]()

        func addHoliday(_ name: String, month: Month, day: Int) {
            holidays.append(Holiday(name: name, date: Date(year: year, month: month, day: day)))
        }
        func addHoliday(_ name: String, date: Date) {
            holidays.append(Holiday(name: name, date: date))
        }

        addHoliday("Neujahrstag", month: .january, day: 1)

        if state?.isIn([.badenWurttemberg, .bavaria, .saxonyAnhalt]) == true {
            addHoliday("Heilige Drei Könige", month: .january, day: 6)
        }

        if year >= 2019 && state == .berlin {
            addHoliday("Internationaler Frauentag", month: .march, day: 8)
        }

        let easter = Date.easter(year: year)

        addHoliday("Karfreitag", date: easter.addingDays(-2))

        if state == .brandenburg {
            addHoliday("Ostersonntag", date: easter)
        }

        addHoliday("Ostermontag", date: easter.addingDays(1))

        addHoliday("Tag der Arbeit", month: .may, day: 1)

        if year == 2020 && state == .berlin {
            addHoliday("75. Jahrestag der Befreiung vom Nationalsozialismus und der Beendigung des Zweiten " +
                "Weltkriegs in Europa", month: .may, day: 8)
        }

        addHoliday("Christi Himmelfahrt", date: easter.addingDays(39))

        if state == .brandenburg {
            addHoliday("Pfingstsonntag", date: easter.addingDays(49))
        }

        addHoliday("Pfingstmontag", date: easter.addingDays(50))

        if state?.isIn([.badenWurttemberg, .bavaria, .hesse, .northRhineWestphalia, .rhinelandPalatinate, .saarland])
            == true {
            addHoliday("Fronleichnam", date: easter.addingDays(60))
        }

        if state == .saarland {
            addHoliday("Mariä Himmelfahrt", month: .august, day: 15)
        }

        if year >= 2019 && state == .thuringia {
            addHoliday("Weltkindertag", month: .september, day: 20)
        }

        addHoliday("Tag der Deutschen Einheit", month: .october, day: 3)

        if year == 2017 {
            addHoliday("Reformationstag", month: .october, day: 31)
        } else if let state = state, state.isIn([.brandenburg, .mecklenburgVorpommern, .saxony, .saxonyAnhalt,
            .thuringia]) || (year >= 2018 && state.isIn([.bremen, .hamburg, .lowerSaxony, .schleswigHolstein])) {
            addHoliday("Reformationstag", month: .october, day: 31)
        }

        if state?.isIn([.badenWurttemberg, .bavaria, .northRhineWestphalia, .rhinelandPalatinate, .saarland]) == true {
            addHoliday("Allerheiligen", month: .november, day: 1)
        }

        if state == .saxony {
            let november23 = Date(year: year, month: .november, day: 23)
            addHoliday("Buß- und Bettag", date: Date.date(of: .wednesday, before: november23))
        }

        addHoliday("Erster Weihnachtsfeiertag", month: .december, day: 25)
        addHoliday("Zweiter Weihnachtsfeiertag", month: .december, day: 26)

        return holidays
    }
}

public enum GermanState: CaseIterable {
    case badenWurttemberg
    case bavaria
    case berlin
    case brandenburg
    case bremen
    case hamburg
    case hesse
    case lowerSaxony
    case mecklenburgVorpommern
    case northRhineWestphalia
    case rhinelandPalatinate
    case saarland
    case saxony
    case saxonyAnhalt
    case schleswigHolstein
    case thuringia

    func isIn(_ states: Set<GermanState>) -> Bool {
        return states.contains(self)
    }
}
