//
//  WeatherCollectionView.swift
//  CommonUI
//
//  Created by 김상우 on 2023/04/02.
//  Copyright © 2023 soma. All rights reserved.
//

import UIKit

open class WeatherCollectionView: UICollectionView {
    public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        initAttribute()
    }
    
    private func initAttribute() {
        self.backgroundColor = UIColor(red: 225/255, green: 225/255, blue: 245/255, alpha: 0.5)
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 8
        self.register(TodayWeatherCollectionCell.self, forCellWithReuseIdentifier: TodayWeatherCollectionCell.cellID)
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
