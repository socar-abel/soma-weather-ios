//
//  WeatherVO.swift
//  Domain
//
//  Created by 김상우 on 2023/04/01.
//  Copyright © 2023 soma. All rights reserved.
//

import Foundation

// Value Object for Domain
public struct ForecastWeatherVO {
    public let list: [WeatherVO]
    public init(list: [WeatherVO]) {
        self.list = list
    }
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
