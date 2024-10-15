//
//  AppCoordinator.swift
//  SomaWeather
//
//  Created by 김상우 on 2023/04/01.
//  Copyright © 2023 soma. All rights reserved.
//

import CommonUI
import Home
import UIKit

protocol AppCoordinator: Coordinator {

    func getChildCoordinator(_ type: CoordinatorType) -> Coordinator?
    func showHomeDemoAppFlow()
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
        showHomeDemoAppFlow()
    }
    
    /// 앱 코디네이터의 자식 코디네이터 get
    func getChildCoordinator(_ type: CoordinatorType) -> Coordinator? {
        var childCoordinator: Coordinator? = nil
        switch type {
        case .home:
            childCoordinator = childCoordinators.first(where: {$0 is HomeCoordinator })
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

    func showHomeDemoAppFlow() {
        let homeViewController = dependency.injector.resolve(HomeViewController.self)
        homeViewController.title = "Home Demo App"
        let dependency = DefaultHomeCoordinator.Dependency.init(homeViewController: homeViewController,
                                                                navigationController: navigationController,
                                                                finishDelegate: self)
        let homeCoordinator = DefaultHomeCoordinator(dependency: dependency)
        homeCoordinator.start()
        childCoordinators.append(homeCoordinator)
    }
}

/// 자식 코디네이터가 종료되었을 때 실행할 메서드
extension DefaultAppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter{ $0.type != childCoordinator.type }
    }
}
