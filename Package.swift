// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "hubkit-model-swift",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "HubkitModel",
            targets: ["HubkitModel"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "HubkitModel",
            dependencies: [],
            path: "Sources"
        ),
    ]
)
