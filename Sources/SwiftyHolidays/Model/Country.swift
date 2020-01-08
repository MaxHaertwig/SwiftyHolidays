public enum Country: HolidayEntity, CaseIterable {
    case germany
    case unitedStates

    init?(isoCode: String) {
        guard 2...3 ~= isoCode.count else { return nil }
        for country in Self.allCases {
            let model = country.model
            if model.iso2Code == isoCode.uppercased() || model.iso3Code == isoCode.uppercased() {
                self = country
                return
            }
        }
        return nil
    }

    var model: CountryModel {
        return Self.mapping[self]!.model
    }

    func allHolidays(year: Int) -> [Holiday] {
        return model.allHolidays(year: year)
    }

    private static let mapping: [Country: CountryWithState] = [
        .germany: .germany(state: nil),
        .unitedStates: .unitedStates(state: nil)
    ]
}

public enum CountryWithState: HolidayEntity, CaseIterable {
    case germany(state: GermanState?)
    case unitedStates(state: USState?)

    var model: CountryModel {
        switch self {
        case .germany(let state):
            return Germany(state: state)
        case .unitedStates(let state):
            return UnitedStates(state: state)
        }
    }

    func allHolidays(year: Int) -> [Holiday] {
        return model.allHolidays(year: year)
    }

    public static var allCases: [CountryWithState] {
        return [
            GermanState.allCases.map { .germany(state: $0) },
            USState.allCases.map { .unitedStates(state: $0) }
        ].flatMap { $0 }
    }
}
