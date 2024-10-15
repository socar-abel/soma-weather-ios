//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김상우 on 2023/03/31.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.create(
    module: .app,
    product: .app,
    infoPlist: AppConfiguration.infoPlist,
    targetDependencies: [
        .project(target: Module.home.name, path: Module.home.path),
        .project(target: Module.forecast.name, path: Module.forecast.path),
        .project(target: Module.search.name, path: Module.search.path),
        .project(target: Module.domain.name, path: Module.domain.path),
        .project(target: Module.data.name, path: Module.data.path),
        .external(name: "Swinject")
    ]
)
