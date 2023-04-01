//
//  WeatherRepository.swift
//  Domain
//
//  Created by 김상우 on 2023/04/01.
//  Copyright © 2023 soma. All rights reserved.
//

import Entity
import RxSwift

public protocol WeatherRepository {
    func getWeather() -> Single<WeatherDTO>
    func getForecast() -> Single<ForecastWeatherDTO>
    //func getCityWeather() -> Single<WeatherVO>
}
