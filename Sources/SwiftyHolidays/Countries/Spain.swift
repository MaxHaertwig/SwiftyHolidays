import Foundation

// https://en.wikipedia.org/wiki/Public_holidays_in_Spain
final class Spain: CountryBase<SpanishCommunity> {

    override var iso2Code: String { "ES" }
    override var iso3Code: String { "ESP" }

    override func allHolidays(year: Int) -> [Holiday] {
        guard year >= 1978 else { return [] }

        var holidays = [Holiday]()

        func addHoliday(_ name: String, month: Month, day: Int) {
            holidays.append(Holiday(name: name, date: Date(year: year, month: month, day: day)))
        }
        func addHoliday(_ name: String, date: Date) {
            holidays.append(Holiday(name: name, date: date))
        }

        addHoliday("Año Nuevo", month: .january, day: 1)

        addHoliday("Día de Reyes / Epifanía del Señor", month: .january, day: 6)

        if state == .andalusia {
            addHoliday("Día de Andalucía", month: .february, day: 28)
        }

        if state == .balearicIslands {
            addHoliday("Dia de les Illes Balears", month: .march, day: 1)
        }

        if state?.isIn([.regionOfMurcia, .valencianCommunity]) == true {
            addHoliday("San José", month: .march, day: 19)
        }

        let easter = Date.easter(year: year)

        if let state = state, !state.isIn([.catalonia, .valencianCommunity]) {
            addHoliday("Jueves Santo", date: easter.addingDays(-3))
        }

        addHoliday("Viernes Santo", date: easter.addingDays(-2))

        if state?.isIn([.catalonia, .balearicIslands, .navarre, .basqueCountry, .valencianCommunity]) == true {
            addHoliday("Lunes de Pascua", date: easter.addingDays(1))
        }

        if state == .aragon {
            addHoliday("San Jorge o Diya d’Aragón", month: .april, day: 23)
        } else if state == .castileAndLeon {
            addHoliday("Día de Castilla y León", month: .april, day: 23)
        }

        addHoliday("Día del Trabajador", month: .may, day: 1)

        if state == .madrid {
            addHoliday("Fiesta de la Comunidad de Madrid", month: .may, day: 2)
        }

        if state == .galicia {
            addHoliday("Día das Letras Galegas", month: .may, day: 17)
        }

        if state == .canaryIslands {
            addHoliday("Día de Canarias", month: .may, day: 30)
        }

        if state == .castilleLaMancha {
            addHoliday("Día de la Región Castilla-La Mancha", month: .may, day: 31)
        }

        if state == .regionOfMurcia {
            addHoliday("Día de la Región de Murcia", month: .june, day: 9)
        } else if state == .laRioja {
            addHoliday("Día de La Rioja", month: .june, day: 9)
        }

        if state == .ceuta {
            addHoliday("San Antonio", month: .june, day: 13)
            addHoliday("San Juan", month: .june, day: 24)
        }

        if state == .galicia {
            addHoliday("Santiago Apóstol o Día da Patria Galega", month: .july, day: 25)
        }

        if state == .ceuta {
            addHoliday("Santa María de África", month: .august, day: 6)
        }

        addHoliday("Asunción", month: .august, day: 15)

        if state?.isIn([.ceuta, .melilla]) == true {
            addHoliday("Celebración del Sacrificio", month: .august, day: 22)
        }

        if state == .asturias {
            addHoliday("Día de Asturias", month: .september, day: 8)
        } else if state == .extremadura {
            addHoliday("Día de Extremadura", month: .september, day: 8)
        }

        if state == .catalonia {
            addHoliday("Diada de Catalunya", month: .september, day: 11)
        }

        if state == .cantabria {
            addHoliday("Día de Cantabria o Día de La Montaña", month: .september, day: 15)
        }

        if state == .melilla {
            addHoliday("Día de Melilla", month: .september, day: 17)
        }

        if state == .valencianCommunity {
            addHoliday("Dia de la Comunitat Valenciana", month: .october, day: 9)
        }

        addHoliday("Fiesta Nacional de España", month: .october, day: 12)

        if state == .basqueCountry {
            addHoliday("Euskadi Eguna", month: .october, day: 25)
        }

        addHoliday("Día de todos los Santos", month: .november, day: 1)

        addHoliday("Día de la Constitución", month: .december, day: 6)

        addHoliday("Inmaculada Concepción", month: .december, day: 8)

        addHoliday("Navidad", month: .december, day: 25)

        if state == .catalonia {
            addHoliday("Sant Esteve", month: .december, day: 26)
        }

        return holidays
    }
}

public enum SpanishCommunity: CaseIterable {
    case andalusia
    case aragon
    case asturias
    case balearicIslands
    case basqueCountry
    case canaryIslands
    case cantabria
    case castilleLaMancha
    case castileAndLeon
    case catalonia
    case extremadura
    case galicia
    case laRioja
    case madrid
    case regionOfMurcia
    case navarre
    case valencianCommunity

    // Autonomous cities
    case ceuta
    case melilla

    func isIn(_ states: Set<SpanishCommunity>) -> Bool {
        return states.contains(self)
    }
}
