class CountryBase<T>: CountryModel {

    var state: T?

    var iso2Code: String { "" }
    var iso3Code: String { "" }

    init(state: T? = nil) {
        self.state = state
    }

    func allHolidays(year: Int) -> [Holiday] {
        return []
    }
}
