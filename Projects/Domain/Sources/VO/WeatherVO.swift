//
//  WeatherVO.swift
//  Domain
//
//  Created by 김상우 on 2023/04/01.
//  Copyright © 2023 soma. All rights reserved.
//

import Entity
import Foundation

// Value Object for Domain
public struct ForecastWeatherVO {
    public let list: [WeatherVO]
}

public struct WeatherVO {
    public let date: String
    public let weatherDescription: String
    public let weatherIcon: String
    public var temp: Float
    public var tempMax: Float
    public var tempMin: Float
    public let humidity: Int
    
    public init(date: String, weatherDescription: String, weatherIcon: String, temp: Float, tempMax: Float, tempMin: Float, humidity: Int) {
        self.date = date
        self.weatherDescription = weatherDescription
        self.weatherIcon = weatherIcon
        self.temp = temp
        self.tempMax = tempMax
        self.tempMin = tempMin
        self.humidity = humidity
    }
}

extension WeatherDTO {
    func toDomain() -> WeatherVO {
        let formattedDate = dateText?.parseToHourMinute()
        let icon = weatherInfo?[0].icon ?? DomainConfiguration.unknownString
        let iconURL = DomainConfiguration.iconUrlStringPreffix + icon + DomainConfiguration.iconUrlStringSuffix
        return WeatherVO(date: formattedDate ?? DomainConfiguration.unknownString,
                     weatherDescription: weatherInfo?[0].description ?? DomainConfiguration.unknownString,
                     weatherIcon: iconURL,
                         temp: mainInfo?.temp?.kelvinToCelsius() ?? DomainConfiguration.unknownFloat,
                     tempMax: mainInfo?.tempMax?.kelvinToCelsius() ?? DomainConfiguration.unknownFloat,
                     tempMin: mainInfo?.tempMin?.kelvinToCelsius() ?? DomainConfiguration.unknownFloat,
                         humidity: mainInfo?.humidity ?? DomainConfiguration.unknownInt)
    }
}

extension ForecastWeatherDTO {
    func toDomain() -> ForecastWeatherVO {
        let weatherList = list ?? []
        return .init(list: Array(weatherList
            .filter{$0.dateText == DomainConfiguration.defaultTime}
            .map{$0.toDomain()}
            .prefix(5)))
    }
    
    func toCurrent() -> WeatherVO? {
        guard let weather = list?[0] else { return nil }
        return weather.toDomain()
    }
    
    func toToday() -> ForecastWeatherVO {
        let weatherList = list ?? []
        return .init(list: Array(weatherList
            .map{$0.toDomain()}
            .prefix(8)))
    }
}
