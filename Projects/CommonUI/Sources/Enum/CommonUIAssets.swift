//
//  CommonUIAssets.swift
//  CommonUI
//
//  Created by 김상우 on 2023/04/02.
//  Copyright © 2023 soma. All rights reserved.
//

import UIKit

public enum CommonUIAssets {
    public static let imgHouseFill = UIImage(systemName: "house.fill")
    public static let imgCloudSunFill = UIImage(systemName: "cloud.sun.fill")
    public static let imgMagnifyingGlassCircleFill = UIImage(systemName: "magnifyingglass.circle.fill")
    public static let imgMagnifyingGlassCircle = UIImage(systemName: "magnifyingglass.circle")
    public static let searchViewTitleBackGroundColor = UIColor(red: 225/255, green: 225/255, blue: 245/255, alpha: 0.7)
}

extension CommonUIAssets {
    public static func homeViewGradientLayer(_ view: UIView) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.white.cgColor,
                                UIColor(red: 160/255, green: 173/255, blue: 243/255, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        return gradientLayer
    }
    
    public static func forecastViewGradientLayer(_ view: UIView) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.white.cgColor,
                                UIColor(red: 160/255, green: 173/255, blue: 243/255, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 1, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        return gradientLayer
    }
    
    public static func searchViewGradientLayer(_ view: UIView) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.white.cgColor,
                                UIColor(red: 160/255, green: 173/255, blue: 243/255, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
        return gradientLayer
    }
}
