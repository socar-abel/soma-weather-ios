//
//  HomeAssembly.swift
//  SomaWeather
//
//  Created by 김상우 on 2023/04/01.
//  Copyright © 2023 soma. All rights reserved.
//

import Swinject
import Home
import Domain

public struct HomeAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(HomeViewModel.self) { resolver in
            let useCase = resolver.resolve(WeatherUseCase.self)!
            return HomeViewModel(weatherUseCase: useCase)
        }

        container.register(HomeViewController.self) { resolver in
            let homeViewModel = resolver.resolve(HomeViewModel.self)!
            return HomeViewController(homeViewModel: homeViewModel)
        }
    }
}
