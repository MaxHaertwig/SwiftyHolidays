import Foundation

public struct Holiday: Equatable {
    let name: String
    let date: Date

    public static func == (lhs: Holiday, rhs: Holiday) -> Bool {
        return lhs.name == rhs.name && lhs.date.triple == rhs.date.triple
    }
}
