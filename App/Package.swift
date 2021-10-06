// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "App",
  defaultLocalization: "en",
  platforms: [
    .iOS(.v15)
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
    // Dependencies declare other packages that this package depends on.
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
