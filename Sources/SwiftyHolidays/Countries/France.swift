import Foundation

// https://en.wikipedia.org/wiki/Public_holidays_in_France
final class France: CountryWithStateBase<FrenchDepartment> {
    override class var iso2Code: String { "FR" }
    override class var iso3Code: String { "FRA" }

    override var defaultTimeZone: TimeZone { TimeZone(abbreviation: "CET")! }

    override func allHolidays(in year: Int) -> [Holiday] {
        guard year >= 1802 else { return [] }
        return buildHolidays(year: year) { builder in
            if year >= 1810 {
                builder.addHoliday("Jour de l'an", date: (.january, 1))
            }

            let easter = LocalDate.easter(in: year)

            if state?.isIn([.basRhin, .hautRhin, .moselle]) == true {
                builder.addHoliday("Vendredi Saint", date: easter.addingDays(-2))
            }

            if year >= 1886 {
                builder.addHoliday("Lundi de Pâques", date: easter.addingDays(1))
            }

            if year >= 1919 {
                builder.addHoliday("Fête du Travail", date: (.may, 1))
            }

            if year >= 1981 {
                builder.addHoliday("Fête de la Victoire", date: (.may, 8))
            }

            builder.addHoliday("Ascension", date: easter.addingDays(39))

            if year >= 1886 {
                builder.addHoliday("Lundi de Pentecôte", date: easter.addingDays(50))
            }

            if year >= 1880 {
                builder.addHoliday("Fête Nationale", date: (.july, 14))
            }

            builder.addHoliday("Assomption", date: (.august, 15))

            builder.addHoliday("Toussaint", date: (.november, 1))

            if year >= 1918 {
                builder.addHoliday("Armistice de 1918", date: (.november, 11))
            }

            builder.addHoliday("Noël", date: (.december, 25))

            if state?.isIn([.basRhin, .hautRhin, .moselle]) == true {
                builder.addHoliday("Deuxième jour de Noël", date: (.december, 26))
            }
        }
    }
}

public enum FrenchDepartment: CaseIterable {
    case ain
    case aisne
    case allier
    case alpesDeHauteProvence
    case hautesAlpes
    case alpesMaritimes
    case ardèche
    case ardennes
    case ariège
    case aube
    case aude
    case aveyron
    case bouchesDuRhône
    case calvados
    case cantal
    case charente
    case charenteMaritime
    case cher
    case corrèze
    case corseDuSud
    case hauteCorse
    case côteDOr
    case côtesDArmor
    case creuse
    case dordogne
    case doubs
    case drôme
    case eure
    case eureEtLoir
    case finistère
    case gard
    case hauteGaronne
    case gers
    case gironde
    case hérault
    case illeEtVilaine
    case indre
    case indreEtLoire
    case isère
    case jura
    case landes
    case loirEtCher
    case loire
    case hauteLoire
    case loireAtlantique
    case loiret
    case lot
    case lotEtGaronne
    case lozère
    case maineEtLoire
    case manche
    case marne
    case mauteMarne
    case mayenne
    case meurtheEtMoselle
    case meuse
    case morbihan
    case moselle
    case nièvre
    case nord
    case oise
    case orne
    case pasDeCalais
    case puyDeDôme
    case pyrénéesAtlantiques
    case hautesPyrénées
    case pyrénéesOrientales
    case basRhin
    case hautRhin
    case rhône
    case lyonMetropolis
    case hauteSaône
    case saôneEtLoire
    case sarthe
    case savoie
    case hauteSavoie
    case paris
    case seineMaritime
    case seineEtMarne
    case yvelines
    case deuxSèvres
    case somme
    case tarn
    case tarnEtGaronne
    case `var`
    case vaucluse
    case vendée
    case vienne
    case hauteVienne
    case vosges
    case yonne
    case territoireDeBelfort
    case essonne
    case hautsDeSeine
    case seineSaintDenis
    case valDeMarne
    case valDOis

    func isIn(_ states: Set<FrenchDepartment>) -> Bool {
        return states.contains(self)
    }
}
