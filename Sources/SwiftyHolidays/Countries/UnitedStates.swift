import Foundation

final class UnitedStates: CountryBase<USState> {
    override var iso2Code: String { "US" }
    override var iso3Code: String { "USA" }

    override func allHolidays(year: Int) -> [Holiday] {
        guard year >= 1776 else { return [] }

        var holidays = [Holiday]()

        func addHoliday(_ holiday: Holiday?) {
            if let holiday = holiday {
                holidays.append(holiday)
            }
        }
        func addHoliday(_ name: String, month: Month, day: Int, checkObservance: Bool = false) {
            let holiday = Holiday(name: name, date: Date(year: year, month: month, day: day))
            holidays.append(holiday)
            if checkObservance, let observedHolday = observedHoliday(of: holiday) {
                holidays.append(observedHolday)
            }
        }
        func addHoliday(_ name: String, date: Date) {
            holidays.append(Holiday(name: name, date: date))
        }

        addHoliday("New Year's Day", month: .january, day: 1, checkObservance: true)

        addHoliday(leeJacksonDay(in: year))

        addHoliday(martinLutherKingJrDay(in: year))

        if state?.isIn([.connecticut, .illinois, .indiana, .newJersey, .newYork]) == true || (state == .california &&
            1971...2009 ~= year) {
            addHoliday("Lincoln's Birthday", month: .february, day: 12, checkObservance: true)
        }

        addHoliday(susanBAnothonyDay(in: year))

        addHoliday(washingtonsBirthday(in: year))

        if state == .illinois && year >= 1978 {
            addHoliday("Casimir Pulaski Day", date: Date.first(.monday, of: .march, in: year))
        }

        if state == .texas && year >= 1874 {
            addHoliday("Texas Independence Day", month: .march, day: 2)
        }

        if state == .vermont && year >= 1800 {
            addHoliday("Town Meeting Day", date: Date.first(.tuesday, of: .march, in: year))
        }

        if state == .massachusetts && year >= 1901 {
            addHoliday("Evacuation Day", month: .march, day: 17, checkObservance: true)
        }

        if state == .alaska {
            let name = "Seward's Day"
            if year >= 1955 {
                addHoliday(name, date: Date.last(.monday, of: .march, in: year))
            } else if year >= 1955 {
                addHoliday(name, month: .march, day: 30)
            }
        }

        if state?.isIn([.maine, .massachusetts]) == true {
            let name = "Patriot's Day"
            if year >= 1969 {
                addHoliday(name, date: Date.calculate(.third, .monday, of: .april, in: year))
            } else if year >= 1894 {
                addHoliday(name, month: .april, day: 19)
            }
        }

        let easter = Date.easter(year: year)

        if state?.isIn([.connecticut, .delaware, .indiana, .kentucky, .louisiana, .newJersey, .northCarolina,
            .tennessee, .texas]) == true {
            addHoliday("Good Friday", date: Date.date(of: .friday, before: easter))
        }

        addHoliday(confederateHeroesDay(in: year))

        if state == .texas && year >= 1875 {
            addHoliday("San Jacinto Day", month: .april, day: 21)
        }

        if state == .nebraska {
            let name = "Arbor Day"
            if year >= 1989 {
                addHoliday(name, date: Date.last(.friday, of: .april, in: year))
            } else if year >= 1885 {
                addHoliday(name, month: .april, day: 22)
            }
        }

        if state == .westVirginia && year >= 1960 && year.isMultiple(of: 2) {
            addHoliday("Primary Election Day", date: Date.calculate(.second, .tuesday, of: .may, in: year))
        } else if state == .indiana && ((year >= 2006 && year.isMultiple(of: 2)) || year >= 2015) {
            let firstMondayInMay = Date.calculate(.first, .monday, of: .may, in: year)
            addHoliday("Primary Election Day", date: Date.date(of: .tuesday, after: firstMondayInMay))
        }

        if state == .missouri && year >= 1949 {
            addHoliday("Truman Day", month: .may, day: 8, checkObservance: true)
        }

        if year >= 1970 {
            addHoliday("Memorial Day", date: Date.last(.monday, of: .may, in: year))
        } else if year >= 1888 {
            addHoliday("Memorial Day", month: .may, day: 30)
        }

        if state == .alabama && year >= 1890 {
            addHoliday("Jefferson Davis' Birthday", date: Date.first(.monday, of: .june, in: year))
        }

        if state == .hawaii && year >= 1872 {
            addHoliday("Kamehameha Day", month: .june, day: 11, checkObservance: year >= 2011)
        }

        if state == .texas && year >= 1980 {
            addHoliday("Emancipation Day", month: .june, day: 19)
        }

        if state == .westVirginia && year >= 1927 {
            addHoliday("West Virginia Day", month: .june, day: 20, checkObservance: true)
        }

        if year >= 1871 {
            addHoliday("Independence Day", month: .july, day: 4, checkObservance: true)
        }

        if state == .utah && year >= 1849 {
            addHoliday("Pioneer Day", month: .july, day: 24, checkObservance: true)
        }

        if state == .rhodeIsland && year >= 1948 {
            addHoliday("Victory Day", date: Date.calculate(.second, .monday, of: .august, in: year))
        }

        if state == .hawaii && year >= 1959 {
            addHoliday("Statehood Day", date: Date.calculate(.third, .friday, of: .august, in: year))
        }

        if state == .vermont && year >= 1778 {
            addHoliday("Bennington Battle Day", month: .august, day: 16, checkObservance: true)
        }

        if state == .texas && year >= 1973 {
            addHoliday("Lyndon Baines Johnson Day", month: .august, day: 27)
        }

        if year >= 1894 {
            addHoliday("Labor Day", date: Date.first(.monday, of: .september, in: year))
        }

        if let state = state, !state.isIn([.alaska, .arkansas, .delaware, .florida, .hawaii, .nevada]) {
            let name = state == .southDakota ? "Native American Day" : "Columbus Day"
            if year >= 1970 {
                addHoliday(name, date: Date.calculate(.second, .monday, of: .october, in: year))
            } else if year >= 1937 {
                addHoliday(name, month: .october, day: 12)
            }
        }

        if state == .alaska && year >= 1867 {
            addHoliday("Alaska Day", month: .october, day: 18, checkObservance: true)
        }

        if state == .nevada && year >= 1933 {
            let name = "Nevada Day"
            if year >= 2000 {
                addHoliday(name, date: Date.last(.friday, of: .october, in: year))
            } else {
                addHoliday(name, month: .october, day: 31, checkObservance: true)
            }
        }

        if (state?.isIn([.delaware, .hawaii, .illinois, .indiana, .louisiana, .montana, .newHampshire, .newJersey,
            .newYork, .westVirginia]) == true && year >= 2008 && year.isMultiple(of: 2)) || (state?.isIn([.indiana,
            .newYork]) == true && year >= 2015) {
            addHoliday("Election Day", date: Date.date(of: .tuesday, after: Date(year: year, month: .november, day: 1)))
        }

        addHoliday(veteransDay(in: year))

        if year >= 1871 {
            addHoliday("Thanksgiving Day", date: Date.calculate(.fourth, .thursday, of: .november, in: year))
        }

        if let state = state, (state.isIn([.kansas, .michigan, .northCarolina]) && year >= 2013) || (state == .texas &&
            year >= 1981) || (state == .wisconsin && year >= 2012) {
            let name = "Christmas Eve"
            let date = Date(year: year, month: .december, day: 24)
            addHoliday(name, date: date)
            if date.weekday == Weekday.friday.rawValue || date.weekday == Weekday.saturday.rawValue {
                addHoliday(name + " (observed)", date: date.addingDays(-1))
            } else if date.weekday == Weekday.sunday.rawValue {
                addHoliday(name + " (observed)", date: date.addingDays(-2))
            }
        }

        if year >= 1870 {
            addHoliday("Christmas Day", month: .december, day: 25, checkObservance: true)
        }

        if state == .northCarolina && year >= 2013 {
            let name = "Day After Christmas"
            let date = Date(year: year, month: .december, day: 26)
            if date.weekday == Weekday.saturday.rawValue {
                addHoliday(name, date: date.addingDays(2))
            } else if date.weekday == Weekday.sunday.rawValue || date.weekday == Weekday.monday.rawValue {
                addHoliday(name, date: date.addingDays(1))
            }
        } else if state == .texas && year >= 1981 {
            addHoliday("Day After Christmas", month: .december, day: 26)
        }

        if (state?.isIn([.kentucky, .michigan]) == true && year >= 2013) || (state == .wisconsin && year >= 2012) {
            let date = Date(year: year, month: .december, day: 31)
            addHoliday("New Year's Eve", date: date.weekday == Weekday.saturday.rawValue ? date.addingDays(-1) : date)
        }

        if Date(year: year, month: .december, day: 31).weekday == Weekday.friday.rawValue {
            addHoliday("New Year's Day (observed)", month: .december, day: 31)
        }

        return holidays
    }

    func observedHoliday(of holiday: Holiday) -> Holiday? {
        if holiday.date.weekday == Weekday.saturday.rawValue {
            return Holiday(name: holiday.name + " (observed)", date: holiday.date.addingDays(-1))
        }
        if holiday.date.weekday == Weekday.sunday.rawValue {
            return Holiday(name: holiday.name + " (observed)", date: holiday.date.addingDays(1))
        }
        return nil
    }

    // https://en.wikipedia.org/wiki/Lee–Jackson–King_Day
    private func leeJacksonDay(in year: Int) -> Holiday? {
        guard state == .virginia else { return nil }
        let mlkDate = Date.calculate(.third, .monday, of: .january, in: year)
        if year >= 2000 {
            return Holiday(name: "Lee-Jackson Day", date: Date.date(of: .friday, before: mlkDate))
        }
        if year >= 1978 {
            return Holiday(name: "Lee-Jackson-King Day", date: mlkDate)
        }
        if year >= 1904 {
            return Holiday(name: "Lee-Jackson Day", date: Date(year: year, month: .january, day: 19))
        }
        if year >= 1889 {
            return Holiday(name: "Robert E. Lee's Birthday", date: Date(year: year, month: .january, day: 19))
        }
        return nil
    }

    // https://en.wikipedia.org/wiki/Martin_Luther_King_Jr._Day
    private func martinLutherKingJrDay(in year: Int) -> Holiday? {
        if year >= 1986 {
            var name = "Birthday of Martin Luther King Jr."
            if state == .alabama {
                name = "Robert E. Lee/Martin Luther King Birthday"
            } else if state == .mississippi {
                name = "Martin Luther King's and Robert E. Lee's Birthdays"
            } else if state == .arizona ||  state == .newHampshire {
                name = "Martin Luther King Jr./Civil Rights Day"
            } else if state == .georgia && year < 2012 {
                name = "Robert E. Lee's Birthday"
            } else if state == .idaho && year >= 2006 {
                name = "Martin Luther King Jr. – Idaho Human Rights Day"
            } else if state == .arkansas {
                name = "Dr. Martin Luther King, Jr.'s Birthday" + (year < 2017 ? " and Robert E. Lee's Birthday" : "")
            } else if state == .virginia && year >= 2000 {
                name = "Martin Luther King, Jr. Day"
            }
            return Holiday(name: name, date: Date.calculate(.third, .monday, of: .january, in: year))
        }
        return nil
    }

    // https://en.wikipedia.org/wiki/Susan_B._Anthony_Day#cite_note-15
    private func susanBAnothonyDay(in year: Int) -> Holiday? {
        guard let state = state else { return nil }
        let name = "Susan B. Anthony Day"
        if (state == .california && year >= 2014) || (state == .florida && year >= 2011) || (state == .newYork &&
            year >= 2014) || (state == .wisconsin && year >= 2014) {
            let holiday = Holiday(name: name, date: Date(year: year, month: .february, day: 15))
            return state == .florida ? observedHoliday(of: holiday) : holiday
        }
        if state == .massachusetts {
            return Holiday(name: name, date: Date(year: year, month: .august, day: 26))
        }
        return nil
    }

    // https://en.wikipedia.org/wiki/Washington%27s_Birthday
    private func washingtonsBirthday(in year: Int) -> Holiday? {
        guard let state = state else { return nil }
        var name = "Washington's Birthday"
        if state.isIn([.hawaii, .newMexico, .northDakota, .oklahoma, .pennsylvania, .southDakota, .texas, .vermont,
        .washington, .alaska, .idaho, .maryland, .nevada, .newHampshire, .tennessee, .westVirginia, .wyoming, .nevada,
        .newJersey, .oregon]) {
            name = "Presidents' Day"
        } else if state == .alabama {
            name = "George Washington/Thomas Jefferson Birthday"
        } else if state == .maine {
            name = "Washington's Birthday/President's Day"
        }
        if state == .georgia {
            let day = Date(year: year, month: .december, day: 24).weekday == Weekday.wednesday.rawValue ? 26 : 24
            return Holiday(name: name, date: Date(year: year, month: .december, day: day))
        }
        if !state.isIn([.delaware, .florida, .newMexico]) {
            if year >= 1971 {
                return Holiday(name: name, date: Date.calculate(.third, .monday, of: .february, in: year))
            }
            if year >= 1879 {
                return Holiday(name: name, date: Date(year: year, month: .february, day: 22))
            }
        }
        return nil
    }

    // https://en.wikipedia.org/wiki/Cesar_Chavez_Day
    private func cesarChavezDay(in year: Int) -> Holiday? {
        guard let state = state else { return nil }
        let name = "César Chávez Day"
        if state == .california && year >= 1995 {
            return observedHoliday(of: Holiday(name: name, date: Date(year: year, month: .march, day: 31)))
        }
        if (state == .texas && year >= 2000) || (state == .colorado && year >= 2003) || (year >= 2015 &&
            state.isIn([.arizona, .michigan, .newMexico, .nevada, .utah, .washington, .wisconsin])) {
            return Holiday(name: name, date: Date(year: year, month: .march, day: 31))
        }
        return nil
    }

    // https://en.wikipedia.org/wiki/Confederate_Memorial_Day
    private func confederateHeroesDay(in year: Int) -> Holiday? {
        guard let state = state, year >= 1866 else { return nil }
        let name = state.isIn([.georgia, .florida, .texas]) ? "Confederate Heroes' Day" : "Confederate Memorial Day"
        if state.isIn([.alabama, .georgia]) {
            return Holiday(name: name, date: Date.calculate(.fourth, .monday, of: .april, in: year))
        }
        if state == .mississippi {
            return Holiday(name: name, date: Date.last(.monday, of: .april, in: year))
        }
        if state == .southCarolina || (state == .northCarolina && year < 2014) {
            return Holiday(name: name, date: Date(year: year, month: .may, day: 10))
        }
        if state == .texas && year >= 1931 {
            return Holiday(name: name, date: Date(year: year, month: .january, day: 19))
        }
        return nil
    }

    private func veteransDay(in year: Int) -> Holiday? {
        let name = year >= 1954 ? "Veterans Day" : "Armistice Day"
        if year >= 1971 && year <= 1977 {
            return Holiday(name: name, date: Date.calculate(.fourth, .monday, of: .october, in: year))
        }
        if year >= 1938 {
            return observedHoliday(of: Holiday(name: name, date: Date(year: year, month: .november, day: 11)))
        }
        return nil
    }

    private func dayAfterThanksgiving(in year: Int) -> Holiday? {
        guard let state = state else { return nil }
        if state.isIn([.nevada, .newMexico]) || (state.isIn([.delaware, .florida, .newHampshire, .northCarolina,
            .oklahoma, .texas, .westVirginia]) && year >= 1975) || (state == .indiana && year >= 2010) ||
        (state == .maryland && year >= 2008) || (state == .georgia && year >= 1986) {
            var name = "Day After Thanksgiving"
            if state.isIn([.florida, .texas]) {
                name = "Friday After Thanksgiving"
            } else if state == .indiana {
                name = "Lincoln's Birthday"
            } else if state == .maryland {
                name = "American Indian Heritage Day"
            } else if state == .nevada {
                name = "Family Day"
            } else if state == .newMexico {
                name = "Presidents Day"
            } else if state == .georgia {
                name = year >= 2016 ? "State Holiday" : "Robert E. Lee's Birthday"
            }
            return Holiday(name: name, date: Date.calculate(.fourth, .thursday, of: .november, in: year).addingDays(1))
        }
        return nil
    }
}

public enum USState: CaseIterable {
    case alabama
    case alaska
    case arizona
    case arkansas
    case california
    case colorado
    case connecticut
    case delaware
    case florida
    case georgia
    case hawaii
    case idaho
    case illinois
    case indiana
    case iowa
    case kansas
    case kentucky
    case louisiana
    case maine
    case maryland
    case massachusetts
    case michigan
    case minnesota
    case mississippi
    case missouri
    case montana
    case nebraska
    case nevada
    case newHampshire
    case newJersey
    case newMexico
    case newYork
    case northCarolina
    case northDakota
    case ohio
    case oklahoma
    case oregon
    case pennsylvania
    case rhodeIsland
    case southCarolina
    case southDakota
    case tennessee
    case texas
    case utah
    case vermont
    case virginia
    case washington
    case westVirginia
    case wisconsin
    case wyoming

    func isIn(_ states: Set<USState>) -> Bool {
        return states.contains(self)
    }
}
