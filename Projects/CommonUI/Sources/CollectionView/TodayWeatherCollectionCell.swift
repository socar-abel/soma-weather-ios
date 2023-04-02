//
//  WeatherCollectionCell.swift
//  CommonUI
//
//  Created by 김상우 on 2023/04/02.
//  Copyright © 2023 soma. All rights reserved.
//

import Domain
import Kingfisher
import UIKit

open class TodayWeatherCollectionCell: UICollectionViewCell {
    public static let cellID = "WeatherCollectionCell"
    let superView = UIView()
    let timeLabel = UILabel()
    let weatherImageView = UIImageView()
    let temperatureLabel = UILabel()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initAttribute()
        initUI()
    }
    
    public func bind(weather: WeatherVO) {
        if let url = URL(string: weather.weatherIcon) {
            weatherImageView.kf.setImage(with: url)
        }
        timeLabel.text = weather.date
        temperatureLabel.text = "\(Int(weather.temp))°C"
    }
    
    func initAttribute() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
        timeLabel.textColor = .black
        timeLabel.font = UIFont.boldSystemFont(ofSize: 12)
        temperatureLabel.textColor = .black
        temperatureLabel.font = UIFont.boldSystemFont(ofSize: 12)
    }
    
    func initUI() {
        contentView.addSubview(superView)
        [timeLabel, weatherImageView, temperatureLabel].forEach { superView.addSubview($0) }
        superView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        timeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.centerX.equalToSuperview()
        }
        weatherImageView.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.bottom)
            $0.width.height.equalTo(46)
            $0.centerX.equalToSuperview()
        }
        temperatureLabel.snp.makeConstraints {
            $0.top.equalTo(weatherImageView.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
        }
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
