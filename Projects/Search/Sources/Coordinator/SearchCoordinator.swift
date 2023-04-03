//
//  SearchCoordinator.swift
//  Search
//
//  Created by 김상우 on 2023/04/03.
//  Copyright © 2023 soma. All rights reserved.
//

import CommonUI
import UIKit

public protocol SearchCoordinator: Coordinator {
    func showSearchFlow()
}

public class DefaultSearchCoordinator: SearchCoordinator {
    public struct Dependency {
        let searchViewController: SearchViewController
        let navigationController: UINavigationController
        weak var finishDelegate: CoordinatorFinishDelegate?
        
        public init(searchViewController: SearchViewController, navigationController: UINavigationController, finishDelegate: CoordinatorFinishDelegate? = nil) {
            self.searchViewController = searchViewController
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
        dependency.searchViewController.viewModel.searchCoordinator = self
    }
    
    public func start() {
        setNavigationBar()
        showSearchFlow()
    }
    
    func setNavigationBar() {
        navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    public func showSearchFlow() {
        navigationController.pushViewController(dependency.searchViewController, animated: true)
    }
}

