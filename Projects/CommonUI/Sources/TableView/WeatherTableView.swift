//
//  WeatherTableView.swift
//  CommonUI
//
//  Created by 김상우 on 2023/04/02.
//  Copyright © 2023 soma. All rights reserved.
//

import UIKit

open class WeatherTableView: UITableView {
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        initAttribute()
    }

    func initAttribute() {
        self.layer.cornerRadius = 8
        self.backgroundColor = UIColor(red: 225/255, green: 225/255, blue: 245/255, alpha: 0.5)
        self.register(WeatherTableCell.self, forCellReuseIdentifier: WeatherTableCell.cellID)
        self.rowHeight = 60
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

