//
//  AppCoordinator.swift
//  SomaWeather
//
//  Created by 김상우 on 2023/04/01.
//  Copyright © 2023 soma. All rights reserved.
//

import CommonUI
import Search
import UIKit

protocol AppCoordinator: Coordinator {

    func getChildCoordinator(_ type: CoordinatorType) -> Coordinator?
    func showSearchDemoAppFlow()
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
        showSearchDemoAppFlow()
    }
    
    /// 앱 코디네이터의 자식 코디네이터 get
    func getChildCoordinator(_ type: CoordinatorType) -> Coordinator? {
        var childCoordinator: Coordinator? = nil
        switch type {
        case .search:
            childCoordinator = childCoordinators.first(where: {$0 is SearchCoordinator })
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

    func showSearchDemoAppFlow() {
        let searchViewController = dependency.injector.resolve(SearchViewController.self)
        searchViewController.title = "Search Demo App"
        let dependency = DefaultSearchCoordinator.Dependency.init(searchViewController: searchViewController,
                                                                  navigationController: navigationController,
                                                                  finishDelegate: self)
        let searchCoordinator = DefaultSearchCoordinator(dependency: dependency)
        searchCoordinator.start()
        childCoordinators.append(searchCoordinator)
    }
}

/// 자식 코디네이터가 종료되었을 때 실행할 메서드
extension DefaultAppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter{ $0.type != childCoordinator.type }
    }
}
