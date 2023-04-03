//
//  WeatherTableCell.swift
//  CommonUI
//
//  Created by 김상우 on 2023/04/02.
//  Copyright © 2023 soma. All rights reserved.
//

import Domain
import UIKit
import Kingfisher

open class WeatherTableCell: UITableViewCell {
    public static let cellID = "WeatherTableCell"
    let superView = UIView()
    let dateLabel = UILabel()
    let weatherImageView = UIImageView()
    let descriptionLabel = UILabel()
    let tempLabel = UILabel()
    let humidityLabel = UILabel()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initAttribute()
        initUI()
    }
    
    public func bind(weather: WeatherVO) {
        if let url = URL(string: weather.weatherIcon) {
            weatherImageView.kf.setImage(with: url)
        }
        tempLabel.text = "\(Int(weather.temp))°C"
        dateLabel.text = weather.date
        descriptionLabel.text = "\(weather.weatherDescription)"
        humidityLabel.text = "\(Int(weather.humidity))%"
    }
    
    func initAttribute() {
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        superView.layer.cornerRadius = 8
        dateLabel.textColor = .black
        dateLabel.font = UIFont.systemFont(ofSize: 10)
        weatherImageView.backgroundColor = .white
        weatherImageView.backgroundColor = .white
        weatherImageView.contentMode = .scaleAspectFit
        weatherImageView.layer.cornerRadius = 8
        weatherImageView.layer.applyShadow(color: .black, alpha: 0.16, x: 0, y: 0, blur: 16)
        descriptionLabel.textColor = .black
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.textAlignment = .center
        tempLabel.textColor = .black
        tempLabel.font = UIFont.boldSystemFont(ofSize: 16)
    }
    
    func initUI() {
        contentView.addSubview(superView)

        [dateLabel, weatherImageView, descriptionLabel, tempLabel, humidityLabel]
            .forEach { superView.addSubview($0) }
        
        contentView.snp.makeConstraints {
            $0.height.equalTo(60)
        }
        
        superView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        dateLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(68)
            $0.left.equalToSuperview().offset(16)
        }
        
        weatherImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(40)
            $0.left.equalTo(dateLabel.snp.right).offset(16)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(120)
            $0.left.equalTo(weatherImageView.snp.right).offset(8)
        }
        
        tempLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(descriptionLabel.snp.right).offset(16)
        }
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

