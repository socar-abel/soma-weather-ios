//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by abel on 10/15/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.create(
    module: .homeDemoApp,
    product: .app,
    infoPlist: AppConfiguration.infoPlist,
    targetDependencies: [
        .project(target: Module.home.name, path: Module.home.path),
        .project(target: Module.domain.name, path: Module.domain.path),
        .project(target: Module.data.name, path: Module.data.path),
        .external(name: "Swinject")
    ]
)
