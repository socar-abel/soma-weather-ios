//
//  AppConfiguration.swift
//  ProjectDescriptionHelpers
//
//  Created by abel on 10/14/24.
//

import Foundation
import ProjectDescription

public enum AppConfiguration {

    public static let appName: String = "SomaWeather"
    public static let organizationName: String = "soma"
    public static let minimumVersion: String = "15.0"
    public static let infoPlist: InfoPlist = .file(path: .path("Support/Info.plist"))
    public static let bundleId: String = "\(organizationName).\(appName)"
    public static let sources: SourceFilesList = "Sources/**"
    public static let resources: ResourceFileElements = [.glob(pattern: "Resources/**")]
    public static let debugConfig: ConfigurationName = "Debug"
}

public extension ConfigurationName {

    func toString() -> String {
        self.rawValue
    }
}
