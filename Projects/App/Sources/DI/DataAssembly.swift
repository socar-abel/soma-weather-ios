//
//  DataAssembly.swift
//  SomaWeather
//
//  Created by 김상우 on 2023/04/01.
//  Copyright © 2023 soma. All rights reserved.
//

import Swinject
import Domain
import Data

public struct DataAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(WeatherDataSource.self) { _ in
            return DefaultWeatherDataSource()
        }
        
        container.register(WeatherRepository.self) { resolver in
            let dataSource = resolver.resolve(WeatherDataSource.self)!
            return DefaultWeatherRepository(dataSource: dataSource)
        }
    }
}
