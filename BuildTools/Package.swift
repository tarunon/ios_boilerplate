// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "BuildTools",
  platforms: [
    .macOS(.v10_11)
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-format", from: "0.50700.1"),
    .package(url: "https://github.com/mono0926/LicensePlist", from: "3.23.4"),
  ],
  targets: [
    .target(
      name: "BuildTools",
      path: ""
    )
  ]
)
