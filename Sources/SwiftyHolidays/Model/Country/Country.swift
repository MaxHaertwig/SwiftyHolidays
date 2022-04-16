import Foundation

/// Represents a country and can be used to retrieve its holidays.
public enum Country: String, CaseIterable, CountryProtocol {
    case austria
    case denmark
    case france
    case germany
    case italy
    case luxembourg
    case spain
    case switzerland
    case unitedStates
    
    // MARK: Public

    /// SwiftyHolidays: Returns a `Country` if a country with the given ISO code exists and is supported by SwiftyHolidays.
    ///
    /// - Parameter isoCode: A 2 or 3 digit ISO 3166 country code.
    public init?(isoCode: String) {
        guard 2...3 ~= isoCode.count else { return nil }
        if let type = Self.countryTypes.first(where: { $0.iso2Code == isoCode.uppercased() || $0.iso3Code ==
            isoCode.uppercased() }) {
            let typeString = String(describing: type)
            if let country = Self.init(rawValue: typeString.prefix(1).lowercased() + typeString.dropFirst()) {
                self = country
                return
            }
        }
        return nil
    }
    
    /// SwiftyHolidays: The 2 digit ISO 3166 country code.
    public var iso2Code: String {
        return type(of: model).iso2Code
    }
    
    /// SwiftyHolidays: The 3 digit ISO 3166 country code.
    public var iso3Code: String {
        return type(of: model).iso3Code
    }
    
    /// SwiftyHolidays: The country's default time zone.
    public var defaultTimeZone: TimeZone {
        return model.defaultTimeZone
    }
    
    /// SwiftyHolidays: Returns a localized display string for the country.
    ///
    /// - Parameter locale: The locale to use for localizing the country's name.
    public func displayString(locale: Locale = .current) -> String {
        return locale.localizedString(forRegionCode: iso2Code) ?? ""
    }

    /// SwiftyHolidays: Returns all holidays of the country in a given year.
    public func allHolidays(in year: Int) -> [Holiday] {
        return model.allHolidays(in: year)
    }

    /// SwifterSwift: Returns a list of all available countries.
    public static var availableCountries: [String] {
        return allCases.map { $0.rawValue }
    }
    
    // MARK: Internal
    
    static var countryTypes: [CountryBase.Type] {
        return [Austria.self, Denmark.self, France.self, Germany.self, Luxembourg.self, Spain.self, Switzerland.self,
            UnitedStates.self]
    }
    
    var model: CountryBase {
        switch self {
        case .denmark:
            return Denmark()
        case .luxembourg:
            return Luxembourg()
        default:
            return Self.mapping[self]!.model
        }
    }
    
    // MARK: Private

    private static let mapping: [Country: CountryWithState] = [
        .austria: .austria(state: nil),
        .france: .france(department: nil),
        .italy: .italy(state: nil),
        .germany: .germany(state: nil),
        .spain: .spain(community: nil),
        .switzerland: .switzerland(canton: nil),
        .unitedStates: .unitedStates(state: nil)
    ]
}

/// Represents a specific state of a country and can be used to retrieve its holidays.
public enum CountryWithState: CaseIterable, CountryProtocol {
    case austria(state: AustrianState?)
    case france(department: FrenchDepartment?)
    case germany(state: GermanState?)
    case italy(state: ItalianRegion?)
    case spain(community: SpanishCommunity?)
    case switzerland(canton: SwissCanton?)
    case unitedStates(state: USState?)

    // MARK: Public
    
    /// SwiftyHolidays: Returns all holidays of the country in a given year.
    public func allHolidays(in year: Int) -> [Holiday] {
        return model.allHolidays(in: year)
    }

    public static var allCases: [CountryWithState] {
        return [
            AustrianState.allCases.map { .austria(state: $0) },
            FrenchDepartment.allCases.map { .france(department: $0) },
            GermanState.allCases.map { .germany(state: $0) },
            ItalianRegion.allCases.map { .italy(state: $0) },
            SpanishCommunity.allCases.map { .spain(community: $0) },
            SwissCanton.allCases.map { .switzerland(canton: $0) },
            USState.allCases.map { .unitedStates(state: $0) }
        ].flatMap { $0 }
    }
    
    // MARK: Internal

    var model: CountryBase {
        switch self {
        case .austria(let state):
            return Austria(state: state)
        case .france(let department):
            return France(state: department)
        case .germany(let state):
            return Germany(state: state)
        case .italy(let state):
            return Italy(state: state)
        case .spain(let community):
            return Spain(state: community)
        case .switzerland(let canton):
            return Switzerland(state: canton)
        case .unitedStates(let state):
            return UnitedStates(state: state)
        }
    }
}
