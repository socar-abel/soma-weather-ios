//
//  ForecastAssembly.swift
//  SomaWeather
//
//  Created by 김상우 on 2023/04/02.
//  Copyright © 2023 soma. All rights reserved.
//

import Swinject
import Forecast
import Domain

public struct ForecastAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(ForecastViewModel.self) { resolver in
            let useCase = resolver.resolve(WeatherUseCase.self)!
            return ForecastViewModel(weatherUseCase: useCase)
        }
        
        container.register(ForecastViewController.self) { resolver in
            let forecastViewModel = resolver.resolve(ForecastViewModel.self)!
            return ForecastViewController(forecastViewModel: forecastViewModel)
        }
    }
}
