//
//  WeatherUseCase.swift
//  Domain
//
//  Created by 김상우 on 2023/04/01.
//  Copyright © 2023 soma. All rights reserved.
//

import RxSwift

public protocol WeatherUseCase {
    func getWeather() -> Single<WeatherVO>
    func getForecast() -> Single<ForecastWeatherVO>
}

public final class DefaultWeatherUseCase: WeatherUseCase {
    let repository: WeatherRepository
    
    public init(repository: WeatherRepository) {
        self.repository = repository
    }
    
    public func getWeather() -> Single<WeatherVO> {
        return repository.getWeather().map{$0.toDomain()}
    }
    
    public func getForecast() -> Single<ForecastWeatherVO> {
        return repository.getForecast().map{$0.toDomain()}
    }
}
