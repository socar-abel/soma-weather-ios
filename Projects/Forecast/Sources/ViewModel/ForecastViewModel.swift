//
//  ForecastViewModel.swift
//  Forecast
//
//  Created by 김상우 on 2023/04/02.
//  Copyright © 2023 soma. All rights reserved.
//

import Domain
import RxSwift
import RxCocoa

protocol ForecastViewModelProtocol {
    func getForecastWeather()
}

public class ForecastViewModel: ForecastViewModelProtocol {
    private let disposeBag = DisposeBag()
    private let weatherUseCase: WeatherUseCase
    public weak var forecastCoordinator: ForecastCoordinator?
    
    /// 날씨 예보 옵저빙
    let weatherListRelay = BehaviorRelay<[WeatherVO]>(value: [])
    
    /// 에러 옵저빙
    let errorRelay = PublishRelay<Bool>()
    
    public init(weatherUseCase: WeatherUseCase) {
        self.weatherUseCase = weatherUseCase
        getForecastWeather()
    }

   /// 일주일간 날씨 예보
    func getForecastWeather() {
        weatherUseCase.getForecast()
            .subscribe(onSuccess: { [weak self] response in
                self?.weatherListRelay.accept(response.list)
            }, onFailure: { [weak self] _ in
                self?.errorRelay.accept(true)
            }).disposed(by: disposeBag)
    }
}

