//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김상우 on 2023/03/31.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.create(
    module: .forecast,
    product: .framework,
    targetDependencies: [
        .project(target: Module.domain.name, path: Module.domain.path),
        .project(target: Module.common.name, path: Module.common.path),
        .project(target: Module.commonUI.name, path: Module.commonUI.path),
        .external(name: "SnapKit"),
        .external(name: "RxSwift"),
        .external(name: "RxCocoa")
    ]
)
