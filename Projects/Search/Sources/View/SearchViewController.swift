//
//  SearchViewController.swift
//  Search
//
//  Created by 김상우 on 2023/04/03.
//  Copyright © 2023 soma. All rights reserved.
//

import Common
import CommonUI
import Domain
import UIKit
import SnapKit
import RxSwift
import RxCocoa
import ReactorKit

public class SearchViewController: BaseViewController, View {
    let titleLabel = UILabel()
    let textField = UITextField()
    let searchButton = UIButton()
    let weatherDetailView = WeatherDetailView()
    
    public override init() {
        super.init()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func setupViewProperty() {
        view.layer.insertSublayer(CommonUIAssets.searchViewGradientLayer(view), at: 0)
        titleLabel.backgroundColor = CommonUIAssets.searchViewTitleBackGroundColor
        titleLabel.layer.cornerRadius = 8
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.cornerRadius = 8
        textField.addLeftPadding()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.text = CommonString.searchViewTitle
        titleLabel.textAlignment = .center
        searchButton.setImage(CommonUIAssets.imgMagnifyingGlassCircle, for: .normal)
        searchButton.backgroundColor = .white
        searchButton.layer.cornerRadius = 15
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewTapkeyboardDown)))
    }
    
    public override func setupHierarchy() {
        [titleLabel, textField, searchButton, weatherDetailView].forEach { view.addSubview($0) }
    }
    
    public override func setupLayout() {
        let guide = view.safeAreaLayoutGuide
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(guide.snp.top).offset(60)
            $0.left.equalToSuperview().offset(40)
            $0.right.equalToSuperview().offset(-40)
            $0.height.equalTo(40)
            $0.centerX.equalToSuperview()
        }
        
        textField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(40)
            $0.right.equalToSuperview().offset(-40)
            $0.height.equalTo(40)
            $0.centerX.equalToSuperview()
        }
        
        searchButton.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(12)
            $0.height.width.equalTo(30)
            $0.centerX.equalToSuperview()
        }
        
        weatherDetailView.snp.makeConstraints {
            $0.top.equalTo(searchButton.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
    }
    
    public func bind(reactor: SearchViewReactor) {
        // MARK: Action
        // 검색 버튼 탭
        searchButton.rx.tap
            .throttle(AppConfiguration.throttleTime, scheduler: MainScheduler.instance)
            .withUnretained(self)
            .map { $0.0 }
            .compactMap { $0.textField.text }
            .map { SearchViewReactor.Action.searchCityWeather($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
            
        // MARK: State
        reactor.state.compactMap{ $0.weather }
            .distinctUntilChanged()
            .withUnretained(self)
            .subscribe(onNext: { (owner, response) in
                owner.weatherDetailView.bind(weather: response)
                owner.weatherDetailView.setTitleLabel(title: owner.textField.text)
            }).disposed(by: disposeBag)
    }
    
    /// 뷰를 누르면 키보드가 내려가도록
    @objc func viewTapkeyboardDown() {
        view.endEditing(true)
    }
}
