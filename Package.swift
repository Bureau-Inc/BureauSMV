// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "BureauSMV",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "BureauSMV",
            targets: ["BureauSMV"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "BureauSMV",
            path: "Framework/BureauSMV.xcframework"
        )
    ]
)
