//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김상우 on 2023/03/31.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.create(
    module: .commonUI,
    product: .framework,
    targetDependencies: [
        .project(target: Module.domain.name, path: Module.domain.path),
        .external(name: "SnapKit"),
        .external(name: "Kingfisher")
    ]
)
