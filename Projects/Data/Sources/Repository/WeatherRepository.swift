//
//  WeatherRepository.swift
//  Data
//
//  Created by 김상우 on 2023/04/01.
//  Copyright © 2023 soma. All rights reserved.
//

import Entity
import Domain
import RxSwift
import Moya
import RxMoya

public class DefaultWeatherRepository: WeatherRepository {
    let moyaProvider = MoyaProvider<WeatherAPI>()
    
    public init() {}
    
    public func getWeather() -> Single<WeatherDTO> {
        return moyaProvider.rx.request(.forecast(lat: NetworkConfiguration.defaultLat,
                                                lon: NetworkConfiguration.defaultLng))
        .map(WeatherDTO.self)
    }
    
    public func getForecast() -> Single<ForecastWeatherDTO> {
        return moyaProvider.rx.request(.forecast(lat: NetworkConfiguration.defaultLat,
                                                 lon: NetworkConfiguration.defaultLng))
        .map(ForecastWeatherDTO.self)
    }
    
    public func getCityWeather(city: String) -> Single<WeatherDTO> {
        return moyaProvider.rx.request(.cityWeather(city: city))
        .map(WeatherDTO.self)
    }
}
