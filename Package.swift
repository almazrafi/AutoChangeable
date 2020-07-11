// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "ChangeableCopy",
    products: [
        .library(
            name: "ChangeableCopy",
            targets: ["ChangeableCopy"]
        )
    ],
    targets: [
        .target(
            name: "ChangeableCopy",
            path: "Sources"
        ),
        .testTarget(
            name: "ChangeableCopyTests",
            dependencies: ["ChangeableCopy"],
            path: "Tests"
        )
    ],
    swiftLanguageVersions: [.v5]
)
