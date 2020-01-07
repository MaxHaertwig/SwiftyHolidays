import Foundation

struct UnitedStates: CountryModel {
    typealias State = USState

    var state: USState?

    init(state: USState? = nil) {
        self.state = state
    }

    var allHolidays: [Holiday] {
        return []
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
    case wyomin
}
