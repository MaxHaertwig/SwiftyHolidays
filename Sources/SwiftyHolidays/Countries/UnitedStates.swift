import Foundation

final class UnitedStates: CountryWithStateBase<USState> {
    override class var iso2Code: String { "US" }
    override class var iso3Code: String { "USA" }

    override var defaultTimeZone: TimeZone {
        if let state = state {
            if state == .alaska {
                return TimeZone(abbreviation: "AKST")!
            }
            if state == .hawaii {
                return TimeZone(abbreviation: "HST")!
            }
            if state.isIn([.california, .nevada, .oregon, .washington]) {
                return TimeZone(abbreviation: "PST")!
            }
            if state.isIn([.arizona, .colorado, .idaho, .montana, .newMexico, .utah, .wyoming]) {
                return TimeZone(abbreviation: "MST")!
            }
            if state.isIn([.arkansas, .alabama, .illinois, .iowa, .kansas, .louisiana, .minnesota, .missouri,
                .mississippi, .nebraska, .northDakota, .oklahoma, .southDakota, .tennessee, .texas, .wisconsin]) {
                return TimeZone(abbreviation: "CST")!
            }
        }
        return TimeZone(abbreviation: "EST")!
    }

    override func allHolidays(in year: Int) -> [Holiday] {
        guard year >= 1776 else { return [] }

        let builder = HolidaysBuilderUS(year: year)

        builder.addHoliday("New Year's Day", date: (.january, 1), checkObservance: true)

        builder.addHoliday(leeJacksonDay(in: year))

        builder.addHoliday(martinLutherKingJrDay(in: year))

        if state?.isIn([.connecticut, .illinois, .indiana, .newJersey, .newYork]) == true || (state == .california &&
            1971...2009 ~= year) {
            builder.addHoliday("Lincoln's Birthday", date: (.february, 12), checkObservance: true)
        }

        builder.addHoliday(tuple: susanBAnothonyDay(in: year))

        builder.addHoliday(washingtonsBirthday(in: year))

        if state == .illinois && year >= 1978 {
            builder.addHoliday("Casimir Pulaski Day", date: Month.march.first(.monday, in: year))
        }

        if state == .texas && year >= 1874 {
            builder.addHoliday("Texas Independence Day", date: (.march, 2))
        }

        if state == .vermont && year >= 1800 {
            builder.addHoliday("Town Meeting Day", date: Month.march.first(.tuesday, in: year))
        }

        if state == .massachusetts && year >= 1901 {
            builder.addHoliday("Evacuation Day", date: (.march, 17), checkObservance: true)
        }

        if state == .alaska {
            if year >= 1955 {
                builder.addHoliday("Seward's Day", date: Month.march.last(.monday, in: year))
            } else if year >= 1955 {
                builder.addHoliday("Seward's Day", date: (.march, 30))
            }
        }

        builder.addHoliday(tuple: cesarChavezDay(in: year))

        if state?.isIn([.maine, .massachusetts]) == true {
            if year >= 1969 {
                builder.addHoliday("Patriot's Day", date: Month.april.get(.third, .monday, in: year))
            } else if year >= 1894 {
                builder.addHoliday("Patriot's Day", date: (.april, 19))
            }
        }

        let easter = LocalDate.easter(in: year)

        if state?.isIn([.connecticut, .delaware, .indiana, .kentucky, .louisiana, .newJersey, .northCarolina,
            .tennessee, .texas]) == true {
            builder.addHoliday("Good Friday", date: easter.addingDays(-2))
        }

        builder.addHoliday(confederateHeroesDay(in: year))

        if state == .texas && year >= 1875 {
            builder.addHoliday("San Jacinto Day", date: (.april, 21))
        }

        if state == .nebraska {
            if year >= 1989 {
                builder.addHoliday("Arbor Day", date: Month.april.last(.friday, in: year))
            } else if year >= 1885 {
                builder.addHoliday("Arbor Day", date: (.april, 22))
            }
        }

        if state == .westVirginia && year >= 1960 && year.isMultiple(of: 2) {
            builder.addHoliday("Primary Election Day", date: Month.may.get(.second, .tuesday, in: year))
        } else if state == .indiana && ((year >= 2006 && year.isMultiple(of: 2)) || year >= 2015) {
            builder.addHoliday("Primary Election Day", date: Month.may.first(.monday, in: year).addingDays(1))
        }

        if state == .missouri && year >= 1949 {
            builder.addHoliday("Truman Day", date: (.may, 8), checkObservance: true)
        }

        if year >= 1970 {
            builder.addHoliday("Memorial Day", date: Month.may.last(.monday, in: year))
        } else if year >= 1888 {
            builder.addHoliday("Memorial Day", date: (.may, 30))
        }

        if state == .alabama && year >= 1890 {
            builder.addHoliday("Jefferson Davis' Birthday", date: Month.june.first(.monday, in: year))
        }

        if state == .hawaii && year >= 1872 {
            builder.addHoliday("Kamehameha Day", date: (.june, 11), checkObservance: year >= 2011)
        }

        if state == .texas && year >= 1980 {
            builder.addHoliday("Emancipation Day", date: (.june, 19))
        }

        if state == .westVirginia && year >= 1927 {
            builder.addHoliday("West Virginia Day", date: (.june, 20), checkObservance: true)
        }

        if year >= 1871 {
            builder.addHoliday("Independence Day", date: (.july, 4), checkObservance: true)
        }

        if state == .utah && year >= 1849 {
            builder.addHoliday("Pioneer Day", date: (.july, 24), checkObservance: true)
        }

        if state == .rhodeIsland && year >= 1948 {
            builder.addHoliday("Victory Day", date: Month.august.get(.second, .monday, in: year))
        }

        if state == .hawaii && year >= 1959 {
            builder.addHoliday("Statehood Day", date: Month.august.get(.third, .friday, in: year))
        }

        if state == .vermont && year >= 1778 {
            builder.addHoliday("Bennington Battle Day", date: (.august, 16), checkObservance: true)
        }

        if state == .texas && year >= 1973 {
            builder.addHoliday("Lyndon Baines Johnson Day", date: (.august, 27))
        }

        if year >= 1894 {
            builder.addHoliday("Labor Day", date: Month.september.first(.monday, in: year))
        }

        if let state = state, !state.isIn([.alaska, .arkansas, .delaware, .florida, .hawaii, .nevada]) {
            let name = state == .southDakota ? "Native American Day" : "Columbus Day"
            if year >= 1970 {
                builder.addHoliday(name, date: Month.october.get(.second, .monday, in: year))
            } else if year >= 1937 {
                builder.addHoliday(name, date: (.october, 12))
            }
        }

        if state == .alaska && year >= 1867 {
            builder.addHoliday("Alaska Day", date: (.october, 18), checkObservance: true)
        }

        if state == .nevada && year >= 1933 {
            let name = "Nevada Day"
            if year >= 2000 {
                builder.addHoliday(name, date: Month.october.last(.friday, in: year))
            } else {
                builder.addHoliday(name, date: (.october, 31), checkObservance: true)
            }
        }

        if (state?.isIn([.delaware, .hawaii, .illinois, .indiana, .louisiana, .montana, .newHampshire, .newJersey,
            .newYork, .westVirginia]) == true && year >= 2008 && year.isMultiple(of: 2)) || (state?.isIn([.indiana,
            .newYork]) == true && year >= 2015) {
            builder.addHoliday("Election Day", date: Month.november.firstDay(in: year).next(.tuesday))
        }

        builder.addHoliday(tuple: veteransDay(in: year))

        if year >= 1871 {
            builder.addHoliday("Thanksgiving Day", date: Month.november.get(.fourth, .thursday, in: year))
        }

        if let state = state, (state.isIn([.kansas, .michigan, .northCarolina]) && year >= 2013) || (state == .texas &&
            year >= 1981) || (state == .wisconsin && year >= 2012) {
            let name = "Christmas Eve"
            let date = LocalDate(year: year, month: .december, day: 24)!
            builder.addHoliday(name, date: date)
            if date.weekday == Weekday.friday || date.weekday == Weekday.saturday {
                builder.addHoliday(name + " (observed)", date: date.addingDays(-1))
            } else if date.weekday == Weekday.sunday {
                builder.addHoliday(name + " (observed)", date: date.addingDays(-2))
            }
        }

        if year >= 1870 {
            builder.addHoliday("Christmas Day", date: (.december, 25), checkObservance: true)
        }

        if state == .northCarolina && year >= 2013 {
            let name = "Day After Christmas"
            let date = LocalDate(year: year, month: .december, day: 26)!
            if date.weekday == Weekday.saturday {
                builder.addHoliday(name, date: date.addingDays(2))
            } else if date.weekday == Weekday.sunday || date.weekday == Weekday.monday {
                builder.addHoliday(name, date: date.addingDays(1))
            }
        } else if state == .texas && year >= 1981 {
            builder.addHoliday("Day After Christmas", date: (.december, 26))
        }

        if (state?.isIn([.kentucky, .michigan]) == true && year >= 2013) || (state == .wisconsin && year >= 2012) {
            let date = LocalDate(year: year, month: .december, day: 31)!
            builder.addHoliday("New Year's Eve", date: date.weekday == Weekday.saturday ? date.addingDays(-1) : date)
        }

        if LocalDate(year: year, month: .december, day: 31)!.weekday == Weekday.friday {
            builder.addHoliday("New Year's Day (observed)", date: (.december, 31))
        }

        return builder.getHolidays()
    }

    // https://en.wikipedia.org/wiki/Lee–Jackson–King_Day
    private func leeJacksonDay(in year: Int) -> Holiday? {
        guard state == .virginia else { return nil }
        let mlkDate = Month.january.get(.third, .monday, in: year)
        if year >= 2000 {
            return Holiday(name: "Lee-Jackson Day", date: mlkDate.previous(.friday))
        }
        if year >= 1978 {
            return Holiday(name: "Lee-Jackson-King Day", date: mlkDate)
        }
        if year >= 1904 {
            return Holiday(name: "Lee-Jackson Day", date: (year, .january, 19))
        }
        if year >= 1889 {
            return Holiday(name: "Robert E. Lee's Birthday", date: (year, .january, 19))
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
            return Holiday(name: name, date: Month.january.get(.third, .monday, in: year))
        }
        return nil
    }

    // https://en.wikipedia.org/wiki/Susan_B._Anthony_Day#cite_note-15
    private func susanBAnothonyDay(in year: Int) -> (Holiday, Bool)? {
        guard let state = state else { return nil }
        let name = "Susan B. Anthony Day"
        if (state == .california && year >= 2014) || (state == .florida && year >= 2011) || (state == .newYork &&
            year >= 2014) || (state == .wisconsin && year >= 2014) {
            let holiday = Holiday(name: name, date: (year, .february, 15))
            return (holiday, state == .florida)
        }
        if state == .massachusetts {
            return (Holiday(name: name, date: (year, .august, 26)), false)
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
            let day = LocalDate(year: year, month: .december, day: 24)!.weekday == Weekday.wednesday ? 26 : 24
            return Holiday(name: name, date: (year, .december, day))
        }
        if !state.isIn([.delaware, .florida, .newMexico]) {
            if year >= 1971 {
                return Holiday(name: name, date: Month.february.get(.third, .monday, in: year))
            }
            if year >= 1879 {
                return Holiday(name: name, date: (year, .february, 22))
            }
        }
        return nil
    }

    // https://en.wikipedia.org/wiki/Cesar_Chavez_Day
    private func cesarChavezDay(in year: Int) -> (Holiday, Bool)? {
        guard let state = state else { return nil }
        let name = "César Chávez Day"
        if state == .california && year >= 1995 {
            return (Holiday(name: name, date: (year, .march, 31)), true)
        }
        if (state == .texas && year >= 2000) || (state == .colorado && year >= 2003) || (year >= 2015 &&
            state.isIn([.arizona, .michigan, .newMexico, .nevada, .utah, .washington, .wisconsin])) {
            return (Holiday(name: name, date: (year, .march, 31)), false)
        }
        return nil
    }

    // https://en.wikipedia.org/wiki/Confederate_Memorial_Day
    private func confederateHeroesDay(in year: Int) -> Holiday? {
        guard let state = state, year >= 1866 else { return nil }
        let name = state.isIn([.georgia, .florida, .texas]) ? "Confederate Heroes' Day" : "Confederate Memorial Day"
        if state.isIn([.alabama, .georgia]) {
            return Holiday(name: name, date: Month.april.get(.fourth, .monday, in: year))
        }
        if state == .mississippi {
            return Holiday(name: name, date: Month.april.last(.monday, in: year))
        }
        if state == .southCarolina || (state == .northCarolina && year < 2014) {
            return Holiday(name: name, date: (year, .may, 10))
        }
        if state == .texas && year >= 1931 {
            return Holiday(name: name, date: (year, .january, 19))
        }
        return nil
    }

    private func veteransDay(in year: Int) -> (Holiday, Bool)? {
        let name = year >= 1954 ? "Veterans Day" : "Armistice Day"
        if year >= 1971 && year <= 1977 {
            return (Holiday(name: name, date: Month.october.get(.fourth, .monday, in: year)), false)
        }
        if year >= 1938 {
            return (Holiday(name: name, date: (year, .november, 11)), true)
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
            return Holiday(name: name, date: Month.november.get(.fourth, .thursday, in: year).addingDays(1))
        }
        return nil
    }
}

/// SwiftyHolidays: Represents a state of the United States of America.
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
