import Foundation

// https://de.wikipedia.org/wiki/Feiertage_in_der_Schweiz
// A, B, C, and D
struct Switzerland: CountryModel {
    typealias State = SwissCanton

    var state: SwissCanton?

    init(state: SwissCanton? = nil) {
        self.state = state
    }

    func allHolidays(year: Int) -> [Holiday] {
        guard year >= 1291 else { return [] }

        var holidays = [Holiday]()

        func addHoliday(_ name: String, month: Month, day: Int) {
            holidays.append(Holiday(name: name, date: Date(year: year, month: month, day: day)))
        }
        func addHoliday(_ name: String, date: Date) {
            holidays.append(Holiday(name: name, date: date))
        }

        addHoliday("Neujahrstag", month: .january, day: 1)

        if state?.isIn([.zurich, .bern, .luzern, .obwalden, .glarus, .zug, .fribourg, .solothurn, .schaffhausen,
            .thurgau, .vaud, .neuchatel, .geneva, .jura]) == true {
            addHoliday("Berchtoldstag", month: .january, day: 2)
        }

        if state?.isIn([.uri, .schwyz, .ticino]) == true {
            addHoliday("Heilige Drei Könige", month: .january, day: 6)
        }

        if state == .neuchatel {
            addHoliday("Jahrestag der Ausrufung der Republik", month: .march, day: 1)
        }

        if state?.isIn([.uri, .schwyz, .nidwalden, .ticino, .valais]) == true {
            addHoliday("Josefstag", month: .march, day: 19)
        }

        let easter = Date.easter(year: year)

        if state == .glarus && year >= 1835 {
            let date = Date.first(.thursday, of: .april, in: year)
            addHoliday("Näfelser Fahrt", date: date != easter.addingDays(-2) ? date : date.addingDays(7))
        }

        if state != .ticino && state != .valais {
            addHoliday("Karfreitag", date: easter.addingDays(-2))
        }

        addHoliday("Ostern", date: easter)

        if let state = state, !state.isIn([.solothurn, .aargau, .valais]) {
            addHoliday("Ostermontag", date: easter.addingDays(1))
        }

        if state?.isIn([.zurich, .solothurn, .baselStadt, .baselLandschaft, .schaffhausen, .thurgau, .ticino,
            .neuchatel, .jura]) == true {
            addHoliday("Tag der Arbeit", month: .may, day: 1)
        }

        addHoliday("Auffahrt", date: easter.addingDays(39))

        if let state = state, !state.isIn([.solothurn, .aargau, .valais]) {
            addHoliday("Pfingstmontag", date: easter.addingDays(50))
        }

        if state?.isIn([.luzern, .uri, .schwyz, .obwalden, .nidwalden, .zug, .appenzellInnerrhoden, .ticino, .valais,
            .jura]) == true {
            addHoliday("Fronleichnam", date: easter.addingDays(60))
        }

        if state == .ticino && year >= 1974 {
            addHoliday("Fest der Unabhängigkeit", month: .june, day: 23)
        }

        if state == .ticino {
            addHoliday("Peter und Paul", month: .june, day: 29)
        }

        addHoliday("Bundesfeier", month: .august, day: 1)

        if state?.isIn([.luzern, .uri, .schwyz, .obwalden, .nidwalden, .zug, .appenzellInnerrhoden, .ticino, .valais,
            .jura]) == true {
            addHoliday("Mariä Himmelfahrt", month: .august, day: 15)
        }

        if state == .vaud {
            addHoliday("Lundi du Jeûne", date: Date.calculate(.third, .sunday, of: .september, in: year).addingDays(1))
        }

        if state == .obwalden {
            addHoliday("Bruder Klaus", month: .september, day: 25)
        }

        if state?.isIn([.luzern, .uri, .schwyz, .obwalden, .nidwalden, .glarus, .zug, .appenzellInnerrhoden, .stGallen,
            .ticino, .valais, .jura]) == true {
            addHoliday("Allerheiligen", month: .november, day: 1)
        }

        if state?.isIn([.luzern, .uri, .schwyz, .obwalden, .nidwalden, .zug, .appenzellInnerrhoden, .ticino, .valais])
            == true {
            addHoliday("Mariä Empfängnis", month: .december, day: 8)
        }

        if state == .geneva {
            addHoliday("Escalade de Genève", month: .december, day: 12)
        }

        addHoliday("Weihnachtstag", month: .december, day: 25)
        addHoliday("Stephanstag", month: .december, day: 26)

        if state == .geneva {
            addHoliday("Wiederherstellung der Republik", month: .december, day: 31)
        }

        return holidays
    }
}

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
