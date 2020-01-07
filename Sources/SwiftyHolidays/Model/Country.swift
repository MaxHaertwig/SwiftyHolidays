public enum Country: HolidayEntity {
    case germany
    case unitedStates

    func allHolidays(year: Int) -> [Holiday] {
        return Self.mapping[self]!.model.allHolidays(year: year)
    }

    private static let mapping: [Country: CountryWithState] = [
        .germany: .germany(state: nil),
        .unitedStates: .unitedStates(state: nil)
    ]
}

public enum CountryWithState: HolidayEntity {
    case germany(state: GermanState?)
    case unitedStates(state: USState?)

    var model: HolidayEntity {
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
}
