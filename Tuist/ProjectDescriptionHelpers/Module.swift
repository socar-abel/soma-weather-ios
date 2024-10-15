//
//  Module.swift
//  ProjectDescriptionHelpers
//
//  Created by abel on 10/14/24.
//

import ProjectDescription

/// 이 앱이 다루는 모듈들.
public enum Module: CaseIterable {

    case app
    case home
    case forecast
    case search
    case common
    case commonUI
    case data
    case domain
}

public extension Module {
    
    /// 모듈의 이름을 반환한다.
    var name: String {
        switch self {
        case .app:
            return "App"
        case .home:
            return "Home"
        case .forecast:
            return "Forecast"
        case .search:
            return "Search"
        case .common:
            return "Common"
        case .commonUI:
            return "CommonUI"
        case .data:
            return "Data"
        case .domain:
            return "Domain"
        }
    }
    
    /// 모듈의 `relativeToRoot` path 를 반환한다.
    var path: Path {
        .relativeToRoot("Projects/\(name)")
    }
}
