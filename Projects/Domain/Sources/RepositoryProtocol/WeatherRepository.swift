//
//  WeatherRepository.swift
//  Domain
//
//  Created by 김상우 on 2023/04/01.
//  Copyright © 2023 soma. All rights reserved.
//

import RxSwift

public protocol WeatherRepository {
    func getWeather() -> Single<WeatherVO?>
    func getForecast() -> Single<ForecastWeatherVO>
    func getCityWeather(city: String) -> Single<WeatherVO?>
}
