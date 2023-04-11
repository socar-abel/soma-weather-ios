//
//  WeatherUseCase.swift
//  Domain
//
//  Created by 김상우 on 2023/04/01.
//  Copyright © 2023 soma. All rights reserved.
//

import RxSwift

public protocol WeatherUseCase {
    func getWeather() -> Single<WeatherVO?>
    func getTodayForecast() -> Single<ForecastWeatherVO>
    func getForecast() -> Single<ForecastWeatherVO>
    func getCityWeather(city: String) -> Single<WeatherVO?>
}

public final class DefaultWeatherUseCase: WeatherUseCase {
    let repository: WeatherRepository
    
    public init(repository: WeatherRepository) {
        self.repository = repository
    }
    
    public func getWeather() -> Single<WeatherVO?> {
        return repository.getWeather()
    }
    
    public func getTodayForecast() -> Single<ForecastWeatherVO> {
        return repository.getForecast()
    }
    
    public func getForecast() -> Single<ForecastWeatherVO> {
        return repository.getForecast()
    }
    
    public func getCityWeather(city: String) -> Single<WeatherVO?> {
        return repository.getCityWeather(city: city)
    }
}
