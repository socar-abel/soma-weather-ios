//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김상우 on 2023/03/31.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "SomaWeather",
    platform: .iOS,
    product: .app,
    dependencies: [
        .project(target: "Home", path: .relativeToRoot("Projects/Home")),
        .project(target: "Forecast", path: .relativeToRoot("Projects/Forecast")),
        .project(target: "Search", path: .relativeToRoot("Projects/Search")),
        .project(target: "Domain", path: .relativeToRoot("Projects/Domain")),
        .project(target: "Data", path: .relativeToRoot("Projects/Data")),
    ],
    resources: ["Resources/**"],
    infoPlist: .file(path: "Support/Info.plist")
)
