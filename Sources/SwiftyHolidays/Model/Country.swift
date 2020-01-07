public enum Country: HolidayEntity {
    case germany(state: GermanState? = nil)
    case unitedStates(state: USState? = nil)

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
