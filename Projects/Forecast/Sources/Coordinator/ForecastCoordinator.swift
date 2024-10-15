//
//  HomeCoordinator.swift
//  Home
//
//  Created by 김상우 on 2023/04/02.
//  Copyright © 2023 soma. All rights reserved.
//

import CommonUI
import UIKit

public protocol ForecastCoordinator: Coordinator {
    func showForecastFlow()
}

public class DefaultForecastCoordinator: ForecastCoordinator {
    public struct Dependency {
        let forecastViewController: ForecastViewController
        let navigationController: UINavigationController
        weak var finishDelegate: CoordinatorFinishDelegate?
        
        public init(forecastViewController: ForecastViewController, navigationController: UINavigationController, finishDelegate: CoordinatorFinishDelegate? = nil) {
            self.forecastViewController = forecastViewController
            self.navigationController = navigationController
            self.finishDelegate = finishDelegate
        }
    }
    
    let dependency: Dependency
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    public var type: CoordinatorType = .forecast
    public var finishDelegate: CoordinatorFinishDelegate?
    
    public init(dependency: Dependency) {
        self.dependency = dependency
        self.navigationController = dependency.navigationController
        self.finishDelegate = dependency.finishDelegate
        dependency.forecastViewController.viewModel.forecastCoordinator = self
    }
    
    public func start() {
        setNavigationBar()
        showForecastFlow()
    }
    
    func setNavigationBar() {
        // Nothing
    }
    
    public func showForecastFlow() {
        navigationController.pushViewController(dependency.forecastViewController, animated: true)
    }
}
