//
//  WeatherRepository.swift
//  Data
//
//  Created by 김상우 on 2023/04/01.
//  Copyright © 2023 soma. All rights reserved.
//

import Domain
import RxSwift
import Moya
import RxMoya

public class DefaultWeatherRepository: WeatherRepository {
    let dataSource: WeatherDataSource
    
    public init(dataSource: WeatherDataSource) {
        self.dataSource = dataSource
    }
    
    public func getWeather() -> Single<WeatherVO?> {
        return dataSource.getForecast().map{$0.toCurrent()}
    }
    
    public func getForecast() -> Single<ForecastWeatherVO> {
        return dataSource.getForecast().map{$0.toToday()}
    }
    
    public func getCityWeather(city: String) -> Single<WeatherVO?> {
        return dataSource.getCityWeather(city: city).map{$0.toDomain(.hourMinute)}
    }
}
