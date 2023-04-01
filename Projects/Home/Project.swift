//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김상우 on 2023/03/31.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "Home",
    product: .staticFramework,
    dependencies: [
        .project(target: "Common", path: .relativeToRoot("Projects/Common")),
        .project(target: "CommonUI", path: .relativeToRoot("Projects/CommonUI")),
        .project(target: "Domain", path: .relativeToRoot("Projects/Domain")),
        .external(name: "SnapKit")
    ],
    resources: ["Resources/**"]
)
