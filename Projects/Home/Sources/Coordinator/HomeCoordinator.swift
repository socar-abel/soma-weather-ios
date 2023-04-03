//
//  HomeCoordinator.swift
//  Home
//
//  Created by 김상우 on 2023/04/02.
//  Copyright © 2023 soma. All rights reserved.
//

import CommonUI
import UIKit

public protocol HomeCoordinator: Coordinator {
    func showHomeFlow()
}

public class DefaultHomeCoordinator: HomeCoordinator {
    public struct Dependency {
        let homeViewController: HomeViewController
        let navigationController: UINavigationController
        weak var finishDelegate: CoordinatorFinishDelegate?
        
        public init(homeViewController: HomeViewController, navigationController: UINavigationController, finishDelegate: CoordinatorFinishDelegate? = nil) {
            self.homeViewController = homeViewController
            self.navigationController = navigationController
            self.finishDelegate = finishDelegate
        }
    }
    
    let dependency: Dependency
    public var childCoordinators: [Coordinator] = []
    public var navigationController: UINavigationController
    public var type: CoordinatorType = .home
    public var finishDelegate: CoordinatorFinishDelegate?
    
    public init(dependency: Dependency) {
        self.dependency = dependency
        self.navigationController = dependency.navigationController
        self.finishDelegate = dependency.finishDelegate
        dependency.homeViewController.viewModel.homeCoordinator = self
    }
    
    public func start() {
        showHomeFlow()
    }
    
    public func showHomeFlow() {
        navigationController.pushViewController(dependency.homeViewController, animated: true)
    }
}
