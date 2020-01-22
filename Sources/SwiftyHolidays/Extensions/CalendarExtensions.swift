import Foundation

extension Calendar {
    init(timeZone: TimeZone) {
        self.init(identifier: .gregorian)
        self.timeZone = timeZone
    }
}
