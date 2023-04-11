//
//  WeatherDTO.swift
//  Data
//
//  Created by 김상우 on 2023/04/11.
//  Copyright © 2023 soma. All rights reserved.
//

import Domain
import Foundation

public struct ForecastWeatherDTO: Decodable {
    public let list: [WeatherDTO]?
}

public struct WeatherDTO: Decodable {
    public let weatherInfo: [WeatherInfoDTO]?
    public let mainInfo: WeatherMainInfo?
    public let dateText: String?
    
    enum CodingKeys: String, CodingKey {
        case weatherInfo = "weather"
        case mainInfo = "main"
        case dateText = "dt_txt"
    }
}

public struct WeatherInfoDTO: Decodable {
    public let id: Int?
    public let description: String?
    public let icon: String?
}

public struct WeatherMainInfo: Decodable {
    public let temp: Float?
    public let tempMin: Float?
    public let tempMax: Float?
    public let humidity: Int?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case humidity
    }
}

enum DateParsingType {
    case hourMinute
    case date
}

extension WeatherDTO {
    func toDomain(_ type: DateParsingType) -> WeatherVO {
        var formattedDate = ""
        switch type {
        case .hourMinute:
            formattedDate = dateText?.parseToHourMinute() ?? DomainConfiguration.unknownString
        case .date:
            formattedDate = dateText?.parseToDate() ?? DomainConfiguration.unknownString
        }
        let icon = weatherInfo?[0].icon ?? DomainConfiguration.unknownString
        let iconURL = DomainConfiguration.iconUrlStringPreffix + icon + DomainConfiguration.iconUrlStringSuffix
        return WeatherVO(date: formattedDate,
                     weatherDescription: weatherInfo?[0].description ?? DomainConfiguration.unknownString,
                     weatherIcon: iconURL,
                         temp: mainInfo?.temp?.kelvinToCelsius() ?? DomainConfiguration.unknownFloat,
                     tempMax: mainInfo?.tempMax?.kelvinToCelsius() ?? DomainConfiguration.unknownFloat,
                     tempMin: mainInfo?.tempMin?.kelvinToCelsius() ?? DomainConfiguration.unknownFloat,
                         humidity: mainInfo?.humidity ?? DomainConfiguration.unknownInt)
    }
}

extension ForecastWeatherDTO {
    func toForecast() -> ForecastWeatherVO {
        let weatherList = list ?? []
        return .init(list: Array(weatherList
            .map{$0.toDomain(.date)}))
    }

    func toCurrent() -> WeatherVO? {
        guard let weather = list?[0] else { return nil }
        return weather.toDomain(.hourMinute)
    }

    func toToday() -> ForecastWeatherVO {
        let weatherList = list ?? []
        return .init(list: Array(weatherList
            .map{$0.toDomain(.hourMinute)}
            .prefix(8)))
    }
}

