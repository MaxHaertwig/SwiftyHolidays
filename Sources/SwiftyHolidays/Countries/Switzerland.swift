import Foundation

// https://de.wikipedia.org/wiki/Feiertage_in_der_Schweiz A, B, C, and D
final class Switzerland: CountryWithStateBase<SwissCanton> {
    override class var iso2Code: String { "CH" }
    override class var iso3Code: String { "CHE" }

    override var defaultTimeZone: TimeZone { TimeZone(abbreviation: "CET")! }

    override func allHolidays(in year: Int) -> [Holiday] {
        guard year >= 1291 else { return [] }
        return buildHolidays(year: year) { builder in
            builder.addHoliday("Neujahrstag", date: (.january, 1))

            if state?.isIn([.zurich, .bern, .luzern, .obwalden, .glarus, .zug, .fribourg, .solothurn, .schaffhausen,
                .thurgau, .vaud, .neuchatel, .geneva, .jura]) == true {
                builder.addHoliday("Berchtoldstag", date: (.january, 2))
            }

            if state?.isIn([.uri, .schwyz, .ticino]) == true {
                builder.addHoliday("Heilige Drei Könige", date: (.january, 6))
            }

            if state == .neuchatel {
                builder.addHoliday("Jahrestag der Ausrufung der Republik", date: (.march, 1))
            }

            if state?.isIn([.uri, .schwyz, .nidwalden, .ticino, .valais]) == true {
                builder.addHoliday("Josefstag", date: (.march, 19))
            }

            let easter = LocalDate.easter(in: year)

            if state == .glarus && year >= 1835 {
                let date = Month.april.first(.thursday, in: year)
                builder.addHoliday("Näfelser Fahrt", date: date != easter.addingDays(-2) ? date : date.addingDays(7))
            }

            if state != .ticino && state != .valais {
                builder.addHoliday("Karfreitag", date: easter.addingDays(-2))
            }

            builder.addHoliday("Ostern", date: easter)

            if let state = state, !state.isIn([.solothurn, .aargau, .valais]) {
                builder.addHoliday("Ostermontag", date: easter.addingDays(1))
            }

            if state?.isIn([.zurich, .solothurn, .baselStadt, .baselLandschaft, .schaffhausen, .thurgau, .ticino,
                .neuchatel, .jura]) == true {
                builder.addHoliday("Tag der Arbeit", date: (.may, 1))
            }

            builder.addHoliday("Auffahrt", date: easter.addingDays(39))

            if let state = state, !state.isIn([.solothurn, .aargau, .valais]) {
                builder.addHoliday("Pfingstmontag", date: easter.addingDays(50))
            }

            if state?.isIn([.luzern, .uri, .schwyz, .obwalden, .nidwalden, .zug, .appenzellInnerrhoden, .ticino,
                .valais, .jura]) == true {
                builder.addHoliday("Fronleichnam", date: easter.addingDays(60))
            }

            if state == .ticino && year >= 1974 {
                builder.addHoliday("Fest der Unabhängigkeit", date: (.june, 23))
            }

            if state == .ticino {
                builder.addHoliday("Peter und Paul", date: (.june, 29))
            }

            builder.addHoliday("Bundesfeier", date: (.august, 1))

            if state?.isIn([.luzern, .uri, .schwyz, .obwalden, .nidwalden, .zug, .appenzellInnerrhoden, .ticino,
                .valais, .jura]) == true {
                builder.addHoliday("Mariä Himmelfahrt", date: (.august, 15))
            }

            if state == .vaud {
                builder.addHoliday("Lundi du Jeûne", date: Month.september.get(.third, .sunday, in: year).addingDays(1))
            }

            if state == .obwalden {
                builder.addHoliday("Bruder Klaus", date: (.september, 25))
            }

            if state?.isIn([.luzern, .uri, .schwyz, .obwalden, .nidwalden, .glarus, .zug, .appenzellInnerrhoden,
                .stGallen, .ticino, .valais, .jura]) == true {
                builder.addHoliday("Allerheiligen", date: (.november, 1))
            }

            if state?.isIn([.luzern, .uri, .schwyz, .obwalden, .nidwalden, .zug, .appenzellInnerrhoden, .ticino,
                .valais]) == true {
                builder.addHoliday("Mariä Empfängnis", date: (.december, 8))
            }

            if state == .geneva {
                builder.addHoliday("Escalade de Genève", date: (.december, 12))
            }

            builder.addHoliday("Weihnachtstag", date: (.december, 25))
            builder.addHoliday("Stephanstag", date: (.december, 26))

            if state == .geneva {
                builder.addHoliday("Wiederherstellung der Republik", date: (.december, 31))
            }
        }
    }
}

/// SwiftyHolidays: Represents a canton of Switzerland.
public enum SwissCanton: CaseIterable {
    // Order in Swiss constitution
    case zurich
    case bern
    case luzern
    case uri
    case schwyz
    case obwalden
    case nidwalden
    case glarus
    case zug
    case fribourg
    case solothurn
    case baselStadt
    case baselLandschaft
    case schaffhausen
    case appenzellAusserrhoden
    case appenzellInnerrhoden
    case stGallen
    case graubunden
    case aargau
    case thurgau
    case ticino
    case vaud
    case valais
    case neuchatel
    case geneva
    case jura

    func isIn(_ cantons: Set<SwissCanton>) -> Bool {
        return cantons.contains(self)
    }
}
