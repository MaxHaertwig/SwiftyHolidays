import Foundation

// https://en.wikipedia.org/wiki/Public_holidays_in_Spain
final class Spain: CountryWithStateBase<SpanishCommunity> {
    override class var iso2Code: String { "ES" }
    override class var iso3Code: String { "ESP" }

    override var defaultTimeZone: TimeZone { TimeZone(abbreviation: "CET")! }

    override func allHolidays(in year: Int) -> [Holiday] {
        guard year >= 1978 else { return [] }
        return buildHolidays(year: year) { builder in
            builder.addHoliday("Año Nuevo", date: (.january, 1))

            builder.addHoliday("Día de Reyes / Epifanía del Señor", date: (.january, 6))

            if state == .andalusia {
                builder.addHoliday("Día de Andalucía", date: (.february, 28))
            }

            if state == .balearicIslands {
                builder.addHoliday("Dia de les Illes Balears", date: (.march, 1))
            }

            if state?.isIn([.regionOfMurcia, .valencianCommunity]) == true {
                builder.addHoliday("San José", date: (.march, 19))
            }

            let easter = LocalDate.easter(in: year)

            if let state = state, !state.isIn([.catalonia, .valencianCommunity]) {
                builder.addHoliday("Jueves Santo", date: easter.addingDays(-3))
            }

            builder.addHoliday("Viernes Santo", date: easter.addingDays(-2))

            if state?.isIn([.catalonia, .balearicIslands, .navarre, .basqueCountry, .valencianCommunity]) == true {
                builder.addHoliday("Lunes de Pascua", date: easter.addingDays(1))
            }

            if state == .aragon {
                builder.addHoliday("San Jorge o Diya d’Aragón", date: (.april, 23))
            } else if state == .castileAndLeon {
                builder.addHoliday("Día de Castilla y León", date: (.april, 23))
            }

            builder.addHoliday("Día del Trabajador", date: (.may, 1))

            if state == .madrid {
                builder.addHoliday("Fiesta de la Comunidad de Madrid", date: (.may, 2))
            }

            if state == .galicia {
                builder.addHoliday("Día das Letras Galegas", date: (.may, 17))
            }

            if state == .canaryIslands {
                builder.addHoliday("Día de Canarias", date: (.may, 30))
            }

            if state == .castilleLaMancha {
                builder.addHoliday("Día de la Región Castilla-La Mancha", date: (.may, 31))
            }

            if state == .regionOfMurcia {
                builder.addHoliday("Día de la Región de Murcia", date: (.june, 9))
            } else if state == .laRioja {
                builder.addHoliday("Día de La Rioja", date: (.june, 9))
            }

            if state == .ceuta {
                builder.addHoliday("San Antonio", date: (.june, 13))
                builder.addHoliday("San Juan", date: (.june, 24))
            }

            if state == .galicia {
                builder.addHoliday("Santiago Apóstol o Día da Patria Galega", date: (.july, 25))
            }

            if state == .ceuta {
                builder.addHoliday("Santa María de África", date: (.august, 6))
            }

            builder.addHoliday("Asunción", date: (.august, 15))

            if state?.isIn([.ceuta, .melilla]) == true {
                builder.addHoliday("Celebración del Sacrificio", date: (.august, 22))
            }

            if state == .asturias {
                builder.addHoliday("Día de Asturias", date: (.september, 8))
            } else if state == .extremadura {
                builder.addHoliday("Día de Extremadura", date: (.september, 8))
            }

            if state == .catalonia {
                builder.addHoliday("Diada de Catalunya", date: (.september, 11))
            }

            if state == .cantabria {
                builder.addHoliday("Día de Cantabria o Día de La Montaña", date: (.september, 15))
            }

            if state == .melilla {
                builder.addHoliday("Día de Melilla", date: (.september, 17))
            }

            if state == .valencianCommunity {
                builder.addHoliday("Dia de la Comunitat Valenciana", date: (.october, 9))
            }

            builder.addHoliday("Fiesta Nacional de España", date: (.october, 12))

            if state == .basqueCountry {
                builder.addHoliday("Euskadi Eguna", date: (.october, 25))
            }

            builder.addHoliday("Día de todos los Santos", date: (.november, 1))

            builder.addHoliday("Día de la Constitución", date: (.december, 6))

            builder.addHoliday("Inmaculada Concepción", date: (.december, 8))

            builder.addHoliday("Navidad", date: (.december, 25))

            if state == .catalonia {
                builder.addHoliday("Sant Esteve", date: (.december, 26))
            }
        }
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
