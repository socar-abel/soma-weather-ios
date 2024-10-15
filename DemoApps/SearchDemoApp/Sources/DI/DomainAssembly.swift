//
//  DomainAssembly.swift
//  SomaWeather
//
//  Created by 김상우 on 2023/04/01.
//  Copyright © 2023 soma. All rights reserved.
//

import Domain
import Swinject

public struct DomainAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(WeatherUseCase.self) { resolver in
            let repository = resolver.resolve(WeatherRepository.self)!
            return DefaultWeatherUseCase(repository: repository)
        }
    }
}
