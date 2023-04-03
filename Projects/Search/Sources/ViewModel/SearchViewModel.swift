//
//  SearchViewModel.swift
//  Search
//
//  Created by 김상우 on 2023/04/03.
//  Copyright © 2023 soma. All rights reserved.
//

import Domain
import CommonUI
import RxSwift
import RxCocoa

protocol SearhViewModelProtocol {
    func requestCityWeather(city: String?)
}

public class SearchViewModel: SearhViewModelProtocol {
    let disposeBag = DisposeBag()
    let weatherUseCase: WeatherUseCase
    public weak var searchCoordinator: SearchCoordinator?
    
    /// 도시 날씨 옵저빙
    let weatherRelay = PublishRelay<WeatherVO>()
    
    /// 에러 옵저빙
    let errorRelay = PublishRelay<Bool>()
    
    public init(weatherUseCase: WeatherUseCase) {
        self.weatherUseCase = weatherUseCase
    }
    
    func requestCityWeather(city: String?) {
        guard let city = city else { return }
        weatherUseCase.getCityWeather(city: city)
            .subscribe(onSuccess: { [weak self] response in
                guard let response = response else { return }
                self?.weatherRelay.accept(response)
            }).disposed(by: disposeBag)
    }
}
