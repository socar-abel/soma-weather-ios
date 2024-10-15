//
//  Workspace.swift
//  ProjectDescriptionHelpers
//
//  Created by 김상우 on 2023/03/31.
//

import ProjectDescription
import ProjectDescriptionHelpers

let workspace = Workspace(
    name: "SomaWeather",
    projects: Module.allCases.map(\.path),
    schemes: [
        .scheme(
            name: AppConfiguration.debugConfig.toString(),
            buildAction: .buildAction(targets: [.project(path: Module.app.path, target: Module.app.name)]),
            runAction: .runAction(configuration: AppConfiguration.debugConfig)
        )
    ]
)
