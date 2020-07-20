// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "Pin",
    platforms: [
        .iOS(.v10),
    ],
    products: [
        .library(
            name: "Pin",
            targets: ["Pin"]),
    ],
    targets: [
        .target(
            name: "Pin",
            dependencies: []),
    ]
)
