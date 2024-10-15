// swift-tools-version: 5.9
//

import PackageDescription

#if TUIST
    import ProjectDescription
    import ProjectDescriptionHelpers

    let packageSettings = PackageSettings(
        baseSettings: .settings(configurations: [
            .debug(name: AppConfiguration.debugConfig)
        ])
    )
#endif

let package = Package(
    name: "package",
    platforms: [.iOS(.v15)],
    dependencies: [
        .package(url: "https://github.com/Swinject/Swinject.git", .upToNextMajor(from: "2.8.0")),
        .package(url: "https://github.com/SnapKit/SnapKit", .upToNextMajor(from: "5.0.1")),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMinor(from: "6.5.0")),
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0")),
        .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "7.0.0")),
        .package(url: "https://github.com/RxSwiftCommunity/RxDataSources.git", .upToNextMajor(from: "5.0.0")),
        .package(url: "https://github.com/ReactorKit/ReactorKit.git", .upToNextMajor(from: "3.0.0"))
    ]
)
