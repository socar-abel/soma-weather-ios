//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김상우 on 2023/03/31.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.create(
    module: Module.data,
    product: .framework,
    targetDependencies: [
        .project(target: Module.domain.name, path: Module.domain.path),
        .external(name: "Moya"),
        .external(name: "RxMoya")
    ]
)
