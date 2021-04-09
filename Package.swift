// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Hubkit",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "Hubkit",
            targets: ["Hubkit"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Hubkit",
            dependencies: [],
            path: "Sources"
        ),
    ]
)
