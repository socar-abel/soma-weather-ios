//
//  HomeViewModel.swift
//  Home
//
//  Created by 김상우 on 2023/04/01.
//  Copyright © 2023 soma. All rights reserved.
//

import Domain
import RxSwift
import RxCocoa

protocol HomeViewModelProtocol {
    func getWeather()
}

public class HomeViewModel: HomeViewModelProtocol {
    private let disposeBag = DisposeBag()
    private let weatherUseCase: WeatherUseCase
    
    /// 현재 날씨빙
    let weatherRelay = PublishRelay<WeatherVO>()
    
    /// 에러 옵저빙
    let errorRelay = PublishRelay<Bool>()
    
    /// 시간별 오늘 날씨
    let todayForecastRelay = PublishRelay<[WeatherVO]>()
    
    public init(weatherUseCase: WeatherUseCase) {
        self.weatherUseCase = weatherUseCase
        getWeather()
        getTodayforecastWeather()
    }
    
    /// 현재 날씨
    func getWeather() {
        weatherUseCase.getWeather()
            .subscribe(onSuccess: { [weak self] response in
                guard let response = response else { return }
                self?.weatherRelay.accept(response)
            }, onFailure: { [weak self] _ in
                self?.errorRelay.accept(true)
            }).disposed(by: disposeBag)
    }
    
    /// 시간별 오늘 날씨
    func getTodayforecastWeather() {
        weatherUseCase.getTodayForecast()
            .subscribe(onSuccess: { [weak self] response in
                self?.todayForecastRelay.accept(response.list)
            }, onFailure: { [weak self] _ in
                self?.errorRelay.accept(true)
            }).disposed(by: disposeBag)
    }
}
