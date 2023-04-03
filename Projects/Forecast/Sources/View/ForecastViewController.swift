//
//  ForecastViewController.swift
//  Forecast
//
//  Created by 김상우 on 2023/04/02.
//  Copyright © 2023 soma. All rights reserved.
//

import CommonUI
import Domain
import UIKit
import RxSwift
import RxCocoa

public class ForecastViewController: BaseViewController {
    let viewModel: ForecastViewModel
    let tableView = WeatherTableView()
    
    public init(forecastViewModel: ForecastViewModel) {
        self.viewModel = forecastViewModel
        super.init()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func setupViewProperty() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.white.cgColor,
                                UIColor(red: 160/255, green: 173/255, blue: 243/255, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 1, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    public override func setupHierarchy() {
        [tableView].forEach{ view.addSubview($0) }
    }
    
    public override func setupLayout() {
        let guide = view.safeAreaLayoutGuide
        tableView.snp.makeConstraints {
            $0.top.equalTo(guide.snp.top).offset(80)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.bottom.equalTo(guide.snp.bottom).offset(-80)
        }
    }
    
    public override func setupBind() {
        viewModel.weatherListRelay
            .subscribe(onNext: { response in
            }).disposed(by: disposeBag)
        
        viewModel.weatherListRelay
            .bind(to: tableView.rx.items(cellIdentifier: WeatherTableCell.cellID,
                                         cellType: WeatherTableCell.self)) { index, data, cell in
                cell.bind(weather: data)
            }.disposed(by: disposeBag)
    }
}
