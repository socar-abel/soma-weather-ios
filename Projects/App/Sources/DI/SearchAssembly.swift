//
//  SearchAssembly.swift
//  SomaWeather
//
//  Created by 김상우 on 2023/04/03.
//  Copyright © 2023 soma. All rights reserved.
//

import Swinject
import Search
import Domain

public struct SearchAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(SearchViewModel.self) { resolver in
            let useCase = resolver.resolve(WeatherUseCase.self)!
            return SearchViewModel(weatherUseCase: useCase)
        }
        
        container.register(SearchViewController.self) { resolver in
            let searchViewModel = resolver.resolve(SearchViewModel.self)!
            return SearchViewController(viewModel: searchViewModel)
        }
    }
}
