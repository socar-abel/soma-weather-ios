//
//  HomeAssembly.swift
//  SomaWeather
//
//  Created by 김상우 on 2023/04/01.
//  Copyright © 2023 soma. All rights reserved.
//

import Swinject
import Home

public struct HomeAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(HomeViewModel.self) { _ in
            return HomeViewModel()
        }
        
        container.register(HomeViewController.self) { resolver in
            let homeViewModel = resolver.resolve(HomeViewModel.self)!
            return HomeViewController(homeViewModel: homeViewModel)
        }
    }
}
