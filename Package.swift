// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "ERC2333",
    platforms: [
        .macOS(.v11),
        .iOS(.v14)
    ],
    products: [
        .library(name: "ERC2333", targets: ["ERC2333"])
    ],
    dependencies: [
        .package(url: "https://github.com/attaswift/BigInt.git", exact: "5.3.0"),
        .package(url: "https://github.com/anquii/BigIntExtensions.git", exact: "0.1.0")
    ],
    targets: [
        .target(name: "ERC2333", dependencies: ["BigInt"]),
        .testTarget(name: "ERC2333Tests", dependencies: ["ERC2333", "BigIntExtensions"])
    ]
)
