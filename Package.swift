// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MathLib",
    platforms: [
        .iOS(.v14)
      ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MathLib",
            targets: ["MathLibTargets"]),
    ],
    targets: [
        .binaryTarget(name: "MathLib", path: "./Sources/MathLib.xcframework"),
        .binaryTarget(name: "AdditionCalculator", path: "./Sources/AdditionCalculator.xcframework"),
        .target(name: "MathLibTargets", dependencies: [
        	.target(name: "MathLib", condition: .when(platforms: [.iOS])),
        	.target(name: "AdditionCalculator", condition: .when(platforms: [.iOS])),
        	], 
        	path:"./Sources/MathLibTargets")
    ]
)
