import Foundation

// https://de.wikipedia.org/wiki/Gesetzliche_Feiertage_in_Deutschland
final class Germany: CountryWithStateBase<GermanState> {
    override class var iso2Code: String { "DE" }
    override class var iso3Code: String { "DEU" }

    override var defaultTimeZone: TimeZone { TimeZone(abbreviation: "CET")! }

    override func allHolidays(in year: Int) -> [Holiday] {
        guard year >= 1989 else { return [] }
        return buildHolidays(year: year) { builder in
            builder.addHoliday("Neujahrstag", date: (.january, 1))

            if state?.isIn([.badenWurttemberg, .bavaria, .saxonyAnhalt]) == true {
                builder.addHoliday("Heilige Drei Könige", date: (.january, 6))
            }

            if year >= 2019 && state == .berlin {
                builder.addHoliday("Internationaler Frauentag", date: (.march, 8))
            }

            let easter = LocalDate.easter(in: year)

            builder.addHoliday("Karfreitag", date: easter.addingDays(-2))

            if state == .brandenburg {
                builder.addHoliday("Ostersonntag", date: easter)
            }

            builder.addHoliday("Ostermontag", date: easter.addingDays(1))

            builder.addHoliday("Tag der Arbeit", date: (.may, 1))

            if year == 2020 && state == .berlin {
                builder.addHoliday("75. Jahrestag der Befreiung vom Nationalsozialismus und der Beendigung des " +
                    "Zweiten Weltkriegs in Europa", date: (.may, 8))
            }

            builder.addHoliday("Christi Himmelfahrt", date: easter.addingDays(39))

            if state == .brandenburg {
                builder.addHoliday("Pfingstsonntag", date: easter.addingDays(49))
            }

            builder.addHoliday("Pfingstmontag", date: easter.addingDays(50))

            if state?.isIn([.badenWurttemberg, .bavaria, .hesse, .northRhineWestphalia, .rhinelandPalatinate,
                .saarland]) == true {
                builder.addHoliday("Fronleichnam", date: easter.addingDays(60))
            }

            if state == .saarland {
                builder.addHoliday("Mariä Himmelfahrt", date: (.august, 15))
            }

            if year >= 2019 && state == .thuringia {
                builder.addHoliday("Weltkindertag", date: (.september, 20))
            }

            builder.addHoliday("Tag der Deutschen Einheit", date: (.october, 3))

            if year == 2017 {
                builder.addHoliday("Reformationstag", date: (.october, 31))
            } else if let state = state, state.isIn([.brandenburg, .mecklenburgVorpommern, .saxony, .saxonyAnhalt,
                .thuringia]) || (year >= 2018 && state.isIn([.bremen, .hamburg, .lowerSaxony, .schleswigHolstein])) {
                builder.addHoliday("Reformationstag", date: (.october, 31))
            }

            if state?.isIn([.badenWurttemberg, .bavaria, .northRhineWestphalia, .rhinelandPalatinate, .saarland])
                == true {
                builder.addHoliday("Allerheiligen", date: (.november, 1))
            }

            if state == .saxony {
                let november23 = LocalDate(year: year, month: .november, day: 23)
                builder.addHoliday("Buß- und Bettag", date: november23.previous(.wednesday))
            }

            builder.addHoliday("Erster Weihnachtsfeiertag", date: (.december, 25))
            builder.addHoliday("Zweiter Weihnachtsfeiertag", date: (.december, 26))
        }
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
