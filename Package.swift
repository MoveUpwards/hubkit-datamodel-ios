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
    dependencies: [
        .package(url: "git@gitlab.com:vbkam/tibtop-model-core.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "HubkitModel",
            dependencies: [
                .product(name: "TibtopModelCore", package: "tibtop-model-core")
            ],
            path: "Sources"
        ),
    ]
)
