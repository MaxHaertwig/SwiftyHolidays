import Foundation

class CountryWithStateBase<T>: CountryBase {
    let state: T?

    init(state: T? = nil) {
        self.state = state
    }
}
