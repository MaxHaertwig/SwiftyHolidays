// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftyHolidays",
    products: [
        .library(name: "SwiftyHolidays", targets: ["SwiftyHolidays"])
    ],
    dependencies: [],
    targets: [
        .target(name: "SwiftyHolidays", dependencies: []),
        .testTarget(name: "SwiftyHolidaysTests", dependencies: ["SwiftyHolidays"])
    ]
)
