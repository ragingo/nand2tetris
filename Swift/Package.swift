// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Nand2Tetris",
    platforms: [.macOS(.v11)],
    products: [
        .executable(name: "n2t", targets: ["Nand2Tetris"])
    ],
    dependencies: [
    ],
    targets: [
        .executableTarget(
            name: "Nand2Tetris",
            dependencies: []),
        .testTarget(
            name: "Nand2TetrisTests",
            dependencies: ["Nand2Tetris"]),
    ]
)
