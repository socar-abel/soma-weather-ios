//
//  AppCoordinator.swift
//  SomaWeather
//
//  Created by 김상우 on 2023/04/01.
//  Copyright © 2023 soma. All rights reserved.
//

import CommonUI
import Forecast
import UIKit

protocol AppCoordinator: Coordinator {

    func getChildCoordinator(_ type: CoordinatorType) -> Coordinator?
    func showForecastDemoAppFlow()
}

final class DefaultAppCoordinator: AppCoordinator{
    public struct Dependency {
        let navigationController: UINavigationController
        let injector: Injector
    }
    
    private let dependency: Dependency
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var type: CoordinatorType = .app
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    init(dependency: Dependency) {
        self.dependency = dependency
        self.navigationController = dependency.navigationController
    }
    
    func start() {
        setNavigationBar()
        showForecastDemoAppFlow()
    }
    
    /// 앱 코디네이터의 자식 코디네이터 get
    func getChildCoordinator(_ type: CoordinatorType) -> Coordinator? {
        var childCoordinator: Coordinator? = nil
        switch type {
        case .forecast:
            childCoordinator = childCoordinators.first(where: {$0 is ForecastCoordinator })
        default:
            break
        }
        return childCoordinator
    }
    
    /// UINavigationController 의 NavigationBar 설정
    func setNavigationBar() {
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.navigationBar.backgroundColor = .white
    }

    func showForecastDemoAppFlow() {
        let forecastViewController = dependency.injector.resolve(ForecastViewController.self)
        forecastViewController.title = "Forecast Demo App"
        let dependency = DefaultForecastCoordinator.Dependency.init(forecastViewController: forecastViewController,
                                                                    navigationController: navigationController,
                                                                    finishDelegate: self)
        let forecastCoordinator = DefaultForecastCoordinator(dependency: dependency)
        forecastCoordinator.start()
        childCoordinators.append(forecastCoordinator)
    }
}

/// 자식 코디네이터가 종료되었을 때 실행할 메서드
extension DefaultAppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter{ $0.type != childCoordinator.type }
    }
}
