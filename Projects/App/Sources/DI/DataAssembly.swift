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
        container.register(WeatherRepository.self) { _ in
            return DefaultWeatherRepository()
        }
    }
}
