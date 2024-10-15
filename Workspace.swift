//
//  Workspace.swift
//  ProjectDescriptionHelpers
//
//  Created by 김상우 on 2023/03/31.
//

import ProjectDescription
import ProjectDescriptionHelpers

let workspace = Workspace(
    name: AppConfiguration.appName,
    projects: ["Projects/**"],
    schemes: [
        .scheme(
            name: AppConfiguration.appName + AppConfiguration.debugConfig.toString(),
            buildAction: .buildAction(targets: [.project(path: Module.app.path, target: Module.app.name)]),
            runAction: .runAction(configuration: AppConfiguration.debugConfig)
        )
    ]
)
