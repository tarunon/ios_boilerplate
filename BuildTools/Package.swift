// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BuildTools",
    platforms: [
        .macOS(.v10_11)
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-format", from: "0.50400.0")
    ],
    targets: [
        .target(
            name: "BuildTools",
            path: ""),
    ]
)
