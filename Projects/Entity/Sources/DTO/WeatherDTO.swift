//
//  WeatherDTO.swift
//  Entity
//
//  Created by 김상우 on 2023/04/01.
//  Copyright © 2023 soma. All rights reserved.
//

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
