//
//  WeatherAPI.swift
//  Data
//
//  Created by 김상우 on 2023/04/01.
//  Copyright © 2023 soma. All rights reserved.
//

import Foundation
import Moya

enum WeatherAPI {
    case weather(lat: Float, lon: Float)
    case forecast(lat: Float, lon: Float)
}

extension WeatherAPI : TargetType {
    var baseURL: URL {
        return URL(string: NetworkConfiguration.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .weather:
            return NetworkConfiguration.currentUrl
        case .forecast:
            return NetworkConfiguration.forecastUrl
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .weather, .forecast:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .weather(let lat, let lon), .forecast(let lat, let lon):
            return .requestParameters(parameters: ["lat" : lat,
                                                   "lon": lon,
                                                   "appid": NetworkConfiguration.appID],
                                      encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return .none
    }
}
