import Foundation

// https://en.wikipedia.org/wiki/Public_holidays_in_France
final class France: CountryBase<FrenchDepartment> {

    override var iso2Code: String { "FR" }
    override var iso3Code: String { "FRA" }

    override func allHolidays(year: Int) -> [Holiday] {
        guard year >= 1802 else { return [] }

        var holidays = [Holiday]()

        func addHoliday(_ name: String, month: Month, day: Int) {
            holidays.append(Holiday(name: name, date: Date(year: year, month: month, day: day)))
        }
        func addHoliday(_ name: String, date: Date) {
            holidays.append(Holiday(name: name, date: date))
        }

        if year >= 1810 {
            addHoliday("Jour de l'an", month: .january, day: 1)
        }

        let easter = Date.easter(year: year)

        if state?.isIn([.basRhin, .hautRhin, .moselle]) == true {
            addHoliday("Vendredi Saint", date: easter.addingDays(-2))
        }

        if year >= 1886 {
            addHoliday("Lundi de Pâques", date: easter.addingDays(1))
        }

        if year >= 1919 {
            addHoliday("Fête du Travail", month: .may, day: 1)
        }

        if year >= 1981 {
            addHoliday("Fête de la Victoire", month: .may, day: 8)
        }

        addHoliday("Ascension", date: easter.addingDays(39))

        if year >= 1886 {
            addHoliday("Lundi de Pentecôte", date: easter.addingDays(50))
        }

        if year >= 1880 {
            addHoliday("Fête Nationale", month: .july, day: 14)
        }

        addHoliday("Assomption", month: .august, day: 15)

        addHoliday("Toussaint", month: .november, day: 1)

        if year >= 1918 {
            addHoliday("Armistice de 1918", month: .november, day: 11)
        }

        addHoliday("Noël", month: .december, day: 25)

        if state?.isIn([.basRhin, .hautRhin, .moselle]) == true {
            addHoliday("Deuxième jour de Noël", month: .december, day: 26)
        }

        return holidays
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
