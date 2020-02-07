# SwiftyHolidays

A swifty library for checking whether a given Date is a holiday in a specific country or state. It can also generate a list of holidays in a given year.

## Installation

**Xcode Project**

Open your project in Xcode, click _File_ > _Swift Packages_ > _Add Package Dependency_ and enter `https://github.com/MaxHaertwig/SwiftyHolidays.git`.

**Swift Package**

Open `Package.swift` and add the package to your project's dependencies:

```swift
let package = Package(
    ...
    dependencies: [
        ...
        .package(url: "https://github.com/MaxHaertwig/SwiftyHolidays.git", from: "1.0.0")
    ]
)
```

## Usage

**LocalDate**

The class `LocalDate` is used to abstract away the concept of time and time zones. You can convert `Date` to `LocalDate` and the other way around.

```swift
import SwiftyHolidays

let independenceDay = LocalDate(2020, .july, 4)!
>>> independenceDay.isHoliday(in: .unitedStates)
true
>>> independenceDay.isHoliday(in: .germany)
false

let cesarChavezDay = LocalDate(2020, .march, 31)!
>>> cesarChavezDay.isHoliday(in: .unitedStates(state: .california))
true
>>> cesarChavezDay.isHoliday(in: .unitedStates(state: .michigan))
false

let holiday = cesarChavezDay.getHoliday(in: .unitedStates(state: .california))
>>> holiday?.name
"César Chávez Day"
>>> holiday?.date
SwiftyHolidays.LocalDate(year: 2020, month: 3, day: 31)
>>> cesarChavezDay.getHoliday(in: .unitedStates(state: .michigan))
nil

>>> LocalDate.asDate(in: TimeZone(abbreviation: "PST")!)
2020-03-31 07:00:00 +0000
```

You can also use Swift's `Date` class. The related methods require a `TimeZone` to interpret the date. If you don't specify one, the default time zone for the given country (or state) will be used.

```swift
import SwiftyHolidays

let independenceDayUTC = Date(timeIntervalSince1970: 1562198400)
>>> independenceDayUTC.isHoliday(in: .unitedStates(state: .california))
false
>>> independenceDayUTC.isHoliday(in: .unitedStates(state: .california), timeZone: TimeZone(abbreviation: "GMT")!)
true

>>> independenceDayUTC.asLocalDate(in: TimeZone(abbreviation: "GMT")!)
SwiftyHolidays.LocalDate(year: 2019, month: 7, day: 4)
>>> independenceDayUTC.asLocalDate(in: TimeZone(abbreviation: "PST")!)
SwiftyHolidays.LocalDate(year: 2019, month: 7, day: 3)
```

Initialize an instance of `Country` or `CountryWithState` to generate a list of its holidays.

```swift
import SwiftyHolidays

>>> Country.germany.allHolidays(in: 2020)
>>> Country.germany.allHolidays(in: 2020..<2030)
>>> CountryWithState.germany(state: .berlin).allHolidays(in: 2020)
```

## Supported Countries

- Austria
- Denmark
- France
- Germany
- Luxembourg
- Spain
- Switzerland
- United States

You can also call `Country.availableCountries` to get a list of supported countries.

## Contributions

[Issues](https://github.com/MaxHaertwig/SwiftyHolidays/issues) and [Pull Requests](https://github.com/MaxHaertwig/SwiftyHolidays/pulls) are always welcome.

## License

SwiftyHolidays is released under the MIT license. See [LICENSE](https://github.com/MaxHaertwig/SwiftyHolidays/blob/master/LICENSE) for more information.
