// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "WorkSurfaceiOSApp",
    platforms: [
        .iOS(.v18),
    ],
    products: [
        .library(
            name: "WorkSurfaceiOSApp",
            targets: ["WorkSurfaceiOSApp"]
        ),
    ],
    targets: [
        .target(
            name: "WorkSurfaceiOSApp",
            swiftSettings: [
                .enableUpcomingFeature("StrictConcurrency"),
            ]
        ),
    ]
)
