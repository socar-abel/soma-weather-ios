//
//  Coordinator.swift
//  CommonUI
//
//  Created by 김상우 on 2023/04/01.
//  Copyright © 2023 soma. All rights reserved.
//

import UIKit

public enum CoordinatorType {
    case app
    case tabbar
    case home
    case forecast
    case search
}

public protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    var type: CoordinatorType { get }
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    func start()
    func finish()
}

extension Coordinator {
    public func finish() {
        childCoordinators.removeAll()
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

public protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: Coordinator)
}
