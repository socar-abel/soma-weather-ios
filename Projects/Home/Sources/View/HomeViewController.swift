//
//  HomeViewController.swift
//  Home
//
//  Created by 김상우 on 2023/04/01.
//  Copyright © 2023 soma. All rights reserved.
//

import CommonUI
import UIKit
import SnapKit
import RxSwift

public class HomeViewController: BaseViewController {
    let viewModel: HomeViewModel
    let weatherDetailView = WeatherDetailView()
    let weatherCollectionView = WeatherCollectionView(frame: CGRect.zero, collectionViewLayout: WeatherCollectionViewFlowLayout())
    
    public init(homeViewModel: HomeViewModel) {
        self.viewModel = homeViewModel
        super.init()
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.white.cgColor,
                                UIColor(red: 160/255, green: 173/255, blue: 243/255, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    public override func setupHierarchy() {
        [weatherDetailView, weatherCollectionView].forEach{ view.addSubview($0) }
    }
    
    public override func setupDelegate() {
        weatherCollectionView.delegate = self
    }
    
    public override func setupLayout() {
        let guide = view.safeAreaLayoutGuide
        weatherDetailView.snp.makeConstraints {
            $0.top.equalTo(guide.snp.top).offset(50)
            $0.centerX.equalToSuperview()
        }
        weatherCollectionView.snp.makeConstraints {
            $0.top.equalTo(weatherDetailView.snp.bottom).offset(60)
            $0.left.equalToSuperview().offset(32)
            $0.right.equalToSuperview().offset(-32)
            $0.height.equalTo(100)
        }
    }
    
    public override func setupBind() {
        viewModel.weatherRelay
            .subscribe(on: MainScheduler.instance)
            .withUnretained(self)
            .bind { (owner, response) in
                owner.weatherDetailView.bind(weather: response)
            }.disposed(by: disposeBag)
        
        viewModel.todayForecastRelay
            .subscribe(on: MainScheduler.instance)
            .bind(to: weatherCollectionView.rx.items(cellIdentifier: TodayWeatherCollectionCell.cellID, cellType: TodayWeatherCollectionCell.self)) { index, data, cell in
                cell.bind(weather: data)
            }.disposed(by: disposeBag)
    }
}


extension HomeViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 100)
    }
}
