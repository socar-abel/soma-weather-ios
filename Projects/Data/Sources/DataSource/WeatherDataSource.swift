//
//  WeatherDataSource.swift
//  Data
//
//  Created by 김상우 on 2023/04/11.
//  Copyright © 2023 soma. All rights reserved.
//

import Domain
import RxSwift
import Moya
import RxMoya

public protocol WeatherDataSource {
    func getWeather() -> Single<WeatherDTO>
    func getForecast() -> Single<ForecastWeatherDTO>
    func getCityWeather(city: String) -> Single<WeatherDTO>
}

public class DefaultWeatherDataSource: WeatherDataSource {
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
