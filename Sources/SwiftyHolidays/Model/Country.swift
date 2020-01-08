public enum Country: HolidayEntity, CaseIterable {
    case austria
    case germany
    case switzerland
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
        .austria: .austria(state: nil),
        .germany: .germany(state: nil),
        .switzerland: .switzerland(canton: nil),
        .unitedStates: .unitedStates(state: nil)
    ]
}

public enum CountryWithState: HolidayEntity, CaseIterable {
    case austria(state: AustrianState?)
    case germany(state: GermanState?)
    case switzerland(canton: SwissCanton?)
    case unitedStates(state: USState?)

    var model: CountryModel {
        switch self {
        case .austria(let state):
            return Austria(state: state)
        case .germany(let state):
            return Germany(state: state)
        case .switzerland(let canton):
            return Switzerland(state: canton)
        case .unitedStates(let state):
            return UnitedStates(state: state)
        }
    }

    func allHolidays(year: Int) -> [Holiday] {
        return model.allHolidays(year: year)
    }

    public static var allCases: [CountryWithState] {
        return [
            AustrianState.allCases.map { .austria(state: $0) },
            GermanState.allCases.map { .germany(state: $0) },
            SwissCanton.allCases.map { .switzerland(canton: $0) },
            USState.allCases.map { .unitedStates(state: $0) }
        ].flatMap { $0 }
    }
}
