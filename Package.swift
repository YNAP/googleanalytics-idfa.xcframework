// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "googleanalytics-idfa",
    products: [
        .library(
            name: "GoogleAnalytics",
            targets: ["GoogleAnalytics", "libAdIdAccessLibrary"]),
    ],
    targets: [
        .binaryTarget(
             name: "libAdIdAccessLibrary",
             path: "Sources/googleanalytics-idfa/libAdIdAccessLibrary.xcframework"
         ),
        .binaryTarget(
             name: "GoogleAnalytics",
             path: "Sources/googleanalytics-idfa/GoogleAnalytics.xcframework"
         )
    ]
)
