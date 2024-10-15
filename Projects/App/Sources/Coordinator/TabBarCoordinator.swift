//
//  TabBarCoordinator.swift
//  SomaWeather
//
//  Created by 김상우 on 2023/04/01.
//  Copyright © 2023 soma. All rights reserved.
//

import CommonUI
import Home
import Forecast
import Search
import UIKit

protocol TabBarCoordinator: Coordinator {
    var tabBarController: UITabBarController { get }
}

final class DefaultTabBarController: TabBarCoordinator {
    public struct Dependency {
        let navigationController: UINavigationController
        let injector: Injector
        weak var finishDelegate: CoordinatorFinishDelegate?
    }
    
    private let dependency: Dependency
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var tabBarController = UITabBarController()
    var type: CoordinatorType = .tabbar
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    init(dependency: Dependency) {
        self.dependency = dependency
        self.navigationController = dependency.navigationController
    }
    
    /// 탭바 flow 시작
    func start() {
        let pages: [TabBarPage] = TabBarPage.allCases
        let controllers: [UINavigationController] = pages.map({
            self.createTabNavigationController(of: $0)
        })
        self.configureTabbarController(with: controllers)
    }
    
    /// 각 탭바에 들어갈 네비게이션 컨트롤러 생성
    private func createTabNavigationController(of page: TabBarPage) -> UINavigationController {
        let tabNavigationController = UINavigationController()
        tabNavigationController.setNavigationBarHidden(false, animated: false)
        tabNavigationController.tabBarItem = self.configureTabBarItem(of: page)
        self.startTabCoordinator(of: page, to: tabNavigationController)
        return tabNavigationController
    }
    
    /// 각 탭바에 들어갈 네비게이션 컨트롤러 설정
    private func configureTabbarController(with tabViewControllers: [UIViewController]) {
        self.tabBarController.setViewControllers(tabViewControllers, animated: true)
        self.tabBarController.selectedIndex = TabBarPage.home.pageOrderNumber()
        self.tabBarController.view.backgroundColor = .white
        self.tabBarController.tabBar.backgroundColor = .white
        self.tabBarController.tabBar.tintColor = .black
        self.navigationController.pushViewController(self.tabBarController, animated: true)
    }

    /// 각 탭바 아이템 설정
    private func configureTabBarItem(of page: TabBarPage) -> UITabBarItem {
        switch page {
        case .home:
            return UITabBarItem(title: page.rawValue, image: CommonUIAssets.imgHouseFill, tag: page.pageOrderNumber())
        case .forecast:
            return UITabBarItem(title: page.rawValue, image: CommonUIAssets.imgCloudSunFill, tag: page.pageOrderNumber())
        case .search:
            return UITabBarItem(title: page.rawValue, image: CommonUIAssets.imgMagnifyingGlassCircleFill, tag: page.pageOrderNumber())
        }
        
    }
    
    /// 각 탭 flow 시작
    private func startTabCoordinator(of page: TabBarPage, to tabNavigationController: UINavigationController) {
        switch page {
        case .home:
            let homeViewController = dependency.injector.resolve(HomeViewController.self)
            let dependency = DefaultHomeCoordinator.Dependency.init(homeViewController: homeViewController,
                                                                    navigationController: tabNavigationController,
                                                                    finishDelegate: self)
            let homeCoordinator = DefaultHomeCoordinator(dependency: dependency)
            homeCoordinator.start()
            childCoordinators.append(homeCoordinator)
            
        case .forecast:
            let forecastViewController = dependency.injector.resolve(ForecastViewController.self)
            let dependency = DefaultForecastCoordinator.Dependency.init(forecastViewController: forecastViewController,
                                                                        navigationController: tabNavigationController,
                                                                        finishDelegate: self)
            let forecastCoordinator = DefaultForecastCoordinator(dependency: dependency)
            forecastCoordinator.start()
            childCoordinators.append(forecastCoordinator)
            
        case .search:
            let searchViewController = dependency.injector.resolve(SearchViewController.self)
            let dependency = DefaultSearchCoordinator.Dependency.init(searchViewController: searchViewController,
                                                                      navigationController: tabNavigationController,
                                                                      finishDelegate: self)
            let searchCoordinator = DefaultSearchCoordinator(dependency: dependency)
            searchCoordinator.start()
            childCoordinators.append(searchCoordinator)
        }
    }
}

/// 탭바 페이지 종류
enum TabBarPage: String, CaseIterable {
    case home, forecast, search
    
    init?(index: Int) {
        switch index {
        case 0: self = .home
        case 1: self = .forecast
        case 2: self = .search
        default: return nil
        }
    }
    
    func pageOrderNumber() -> Int {
        switch self {
        case .home: return 0
        case .forecast: return 1
        case .search: return 2
        }
    }
    
    func tabIconName() -> String {
        return self.rawValue
    }
}


/// 자식 코디네이터가 종료되었을 때 처리
extension DefaultTabBarController: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter{ $0.type != childCoordinator.type }
    }
}
