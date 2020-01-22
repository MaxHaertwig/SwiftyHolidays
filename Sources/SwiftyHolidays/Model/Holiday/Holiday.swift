import Foundation

public struct Holiday: Equatable {
    let name: String
    let date: LocalDate

    init(name: String, date: LocalDate) {
        self.name = name
        self.date = date
    }

    init(name: String, date: (Int, Month, Int)) {
        self.name = name
        self.date = LocalDate(year: date.0, month: date.1, day: date.2)
    }
}
