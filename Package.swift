// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FoundationExtensions",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "FoundationExtensions",
            targets: ["FoundationExtensions"]),
    ],
    targets: [
        .target(
            name: "FoundationExtensions",
            dependencies: [],
            path: "FoundationExtensions"),
        .testTarget(
            name: "FoundationExtensionsTests",
            dependencies: ["FoundationExtensions"],
            path: "FoundationExtensionsTests")
    ]
)
