//
//  Dependencies.swift
//  Config
//
//  Created by 김상우 on 2023/04/01.
//

import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
     swiftPackageManager: .init(
         [
            .remote(url: "https://github.com/Swinject/Swinject.git", requirement: .upToNextMajor(from: "2.8.0")),
            .remote(url: "https://github.com/SnapKit/SnapKit", requirement: .upToNextMajor(from: "5.0.1")),
            .remote(url: "https://github.com/ReactiveX/RxSwift.git", requirement: .upToNextMinor(from: "6.5.0")),
            .remote(url: "https://github.com/Moya/Moya.git", requirement: .upToNextMajor(from: "15.0.0")),
            .remote(url: "https://github.com/onevcat/Kingfisher.git", requirement: .upToNextMajor(from: "7.0.0")),
            .remote(url: "https://github.com/RxSwiftCommunity/RxDataSources.git", requirement: .upToNextMajor(from: "5.0.0")),
            .remote(url: "https://github.com/ReactorKit/ReactorKit.git", requirement: .upToNextMajor(from: "3.0.0"))

         ],
         productTypes: [
            "Moya": .framework,
            "RxMoya": .framework,
            "Alamofire": .framework
         ]
     ),
     platforms: [.iOS]
 )

