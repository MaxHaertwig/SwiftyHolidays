//
//  File.swift
//  
//
//  Created by Francesco Bianco on 16/04/22.
//

import Foundation

// https://it.wikipedia.org/wiki/Festivit%C3%A0_in_Italia
final class Italy: CountryWithStateBase<ItalianRegion> {
    
    override class var iso2Code: String { "IT" }
    override class var iso3Code: String { "ITA" }

    override var defaultTimeZone: TimeZone { TimeZone(abbreviation: "CET")! }
    
    override func allHolidays(in year: Int) -> [Holiday] {
        return buildHolidays(year: year) { builder in
            
            if year < 1968 {
                builder.addHoliday("Capodanno", date: (.january, 1))
            }
            
            if !(1978...1985).contains(year) {
                builder.addHoliday("Epifania", date: (.january, 6))
            }
            
            let easter = LocalDate.easter(in: year)
            builder.addHoliday("Pasqua", date: easter)
            builder.addHoliday("Lunedì dell'Angelo", date: easter.addingDays(1))

            builder.addHoliday("Festa della Liberazione", date: (.april, 25))
            
            builder.addHoliday("Festa dei Lavoratori", date: (.may, 1))
            
            builder.addHoliday("Festa della repubblica Italiana", date: (.june, 2))

            builder.addHoliday("Assunzione di Maria/Ferragosto", date: (.august, 15))

            builder.addHoliday("Ognissanti", date: (.november, 1))
            
            builder.addHoliday("Immacolata concezione", date: (.december, 8))
            
            builder.addHoliday("Natale", date: (.december, 25))
            
            builder.addHoliday("Santo Stefano", date: (.december, 26))
            
            if year <= 1977 {
                builder.addHoliday("San Giuseppe", date: (.march, 19))
                builder.addHoliday("Ascensione", date: easter.addingDays(40))
                builder.addHoliday("Corpus Domini", date: easter.addingDays(60))
                builder.addHoliday("San Pietro e Paolo, patroni di Roma", date: (.june, 29))
                builder.addHoliday("San Francesco D'Assisi, patrono d'Italia", date: (.october, 4))
                builder.addHoliday("Giornata dell'unità nazionale e delle Forze Armate", date: (.november, 4))
            }
        }
    }
}


/// SwiftyHolidays: Represents a region of Italy.
public enum ItalianRegion: CaseIterable {
    case lombardia
    case lazio
    case veneto
    case campania
    case sicilia
    case emilia_romagna
    case piemonte
    case puglia
    case toscana
    case calabria
    case sardegna
    case liguria
    case marche
    case abruzzo
    case griuli_venezia_giulia
    case trentino_alto_adige
    case umbria
    case basilicata
    case molise
    case valle_daosta
}
