// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "LittlePin",
    platforms: [
        .iOS(.v10),
    ],
    products: [
        .library(
            name: "LittlePin",
            targets: ["LittlePin"]),
    ],
    targets: [
        .target(
            name: "LittlePin",
            dependencies: []),
    ]
)
