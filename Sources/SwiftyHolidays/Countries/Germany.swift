import Foundation

struct Germany: CountryModel {
    typealias State = GermanState

    var state: GermanState?

    init(state: GermanState? = nil) {
        self.state = state
    }

    func allHolidays(year: Int) -> [Holiday] {
        return []
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
}
