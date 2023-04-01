//
//  HomeViewModel.swift
//  Home
//
//  Created by 김상우 on 2023/04/01.
//  Copyright © 2023 soma. All rights reserved.
//

import Domain
import RxSwift

protocol HomeViewModelProtocol {
    func getWeather()
}

public class HomeViewModel: HomeViewModelProtocol {
    private let disposeBag = DisposeBag()
    private let weatherUseCase: WeatherUseCase
    public init(weatherUseCase: WeatherUseCase) {
        self.weatherUseCase = weatherUseCase
        getWeather()
    }
    
    func getWeather() {
        weatherUseCase.getWeather()
            .subscribe(onSuccess: { response in
                print(response)
            }, onFailure: { _ in
                
            }).disposed(by: disposeBag)
    }
}
