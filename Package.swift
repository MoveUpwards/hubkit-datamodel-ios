// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "HubkitDataModel",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "HubkitDataModel",
            targets: ["HubkitDataModel"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "HubkitDataModel",
            dependencies: [],
            path: "Sources"
        ),
    ]
)
