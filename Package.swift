// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CocoaMQTT",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v10),
        .tvOS(.v10)
    ],
    products: [
        .library(name: "CocoaMQTT", targets: [ "CocoaMQTT" ]),
    ],
    dependencies: [
        .package(url: "https://github.com/nrohwedder/CocoaAsyncSocket", .exact("7.6.5")),
    ],
    targets: [
        .target(name: "CocoaMQTT",
                dependencies: [ "CocoaAsyncSocket" ],
                path: "Source",
                swiftSettings: [ .define("IS_SWIFT_PACKAGE")]),
        .testTarget(name: "CocoaMQTTTests",
                    dependencies: [ "CocoaMQTT" ],
                    path: "CocoaMQTTTests",
                    swiftSettings: [ .define("IS_SWIFT_PACKAGE")])
    ]
)
