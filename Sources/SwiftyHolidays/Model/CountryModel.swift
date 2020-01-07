import Foundation

protocol CountryModel: HolidayEntity {
    associatedtype State

    var state: State? { get }

    init(state: State?)
}
