// swift-tools-version:5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "App",
  defaultLocalization: "en",
  platforms: [
    .iOS(.v16)
  ],
  products: [
    .library(
      name: "App",
      type: .static,
      targets: ["App"]
    ),
    .library(
      name: "Preview",
      type: .dynamic,
      targets: ["Components"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-format", from: "508.0.1"),
    .package(url: "https://github.com/mono0926/LicensePlist", from: "3.24.10"),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "App",
      dependencies: ["Components"]
    ),
    .target(
      name: "Components",
      dependencies: ["Bundles"]
    ),
    .target(
      name: "Bundles"
    ),
    .testTarget(
      name: "AppTests",
      dependencies: ["App"]
    ),
  ]
)
