// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "AutoChangeable",
    products: [
        .library(
            name: "AutoChangeable",
            targets: ["AutoChangeable"]
        )
    ],
    targets: [
        .target(
            name: "AutoChangeable",
            path: "Sources"
        ),
        .testTarget(
            name: "AutoChangeableTests",
            dependencies: ["AutoChangeable"],
            path: "Tests"
        )
    ],
    swiftLanguageVersions: [.v5]
)
