//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김상우 on 2023/03/31.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "Domain",
    product: .staticFramework,
    dependencies: [
        .external(name: "RxSwift")
    ],
    resources: ["Resources/**"]
)
