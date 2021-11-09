// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "NetworkManager",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "NetworkManager", targets: ["NetworkManager"]),
    ],
    targets: [
        .target(
            name: "NetworkManager",
            dependencies: []),
        .testTarget(
            name: "NetworkManagerTests",
            dependencies: ["NetworkManager"]),
    ]
)
