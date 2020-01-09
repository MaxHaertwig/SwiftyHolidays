import Foundation

enum Month: Int, CaseIterable {
    case january = 1
    case february = 2
    case march = 3
    case april = 4
    case may = 5
    case june = 6
    case july = 7
    case august = 8
    case september = 9
    case october = 10
    case november = 11
    case december = 12

    func length(in year: Int) -> Int {
        switch self {
        case .january, .march, .may, .july, .august, .october, .december:
            return 31
        case .february:
            return year % 4 == 0 ? 29 : 28
        default:
            return 30
        }
    }

    func firstDay(in year: Int) -> Date {
        return Date(year: year, month: self, day: 1)
    }

    func lastDay(in year: Int) -> Date {
        return Date(year: year, month: self, day: length(in: year))
    }
}
