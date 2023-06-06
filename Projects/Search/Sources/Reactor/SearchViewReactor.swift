//
//  SearchViewReactor.swift
//  Search
//
//  Created by abel on 2023/05/29.
//  Copyright © 2023 soma. All rights reserved.
//

import ReactorKit
import RxSwift
import Domain

public final class SearchViewReactor: Reactor {
    private let disposeBag = DisposeBag()
    private let weatherUseCase: WeatherUseCase
    public var initialState: State
    
    public enum Action {
        /// 도시의 날씨 검색
        case searchCityWeather(String)
    }
    
    public enum Mutation {
        /// 도시 날씨 정보 세팅
        case setCityWeather(WeatherVO)
        /// 로딩 중 세팅
        case setLoading(Bool)
    }
    
    public struct State {
        /// 검색한 도시의 날씨
        var weather: WeatherVO?
        /// 로딩 중
        var isLoading: Bool
    }
    
    public init(weatherUseCase: WeatherUseCase) {
        self.weatherUseCase = weatherUseCase
        initialState = State(
            weather: nil,
            isLoading: false
        )
    }
    
    // Action -> Mutation
    public func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case let .searchCityWeather(cityName):
            return performSearchCityWeather(cityName: cityName)
        }
    }
    
    // Mutation -> State
    public func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case let .setCityWeather(weather):
            state.weather = weather
            
        case let .setLoading(isLoading):
            state.isLoading = isLoading
        }
        return state
    }
    
    /// 도시의 날씨 가져오기
    func performSearchCityWeather(cityName: String) -> Observable<Mutation> {
        if currentState.isLoading { return .empty() }
        return .concat(
            .just(.setLoading(true)),
            weatherUseCase.getCityWeather(city: cityName)
                .asObservable()
                .catchAndReturn(nil)
                .compactMap { $0 }
                .map { .setCityWeather($0) },
            .just(.setLoading(false))
        )
    }
}
