//
//  BaseCoordinator.swift
//  CoordinatorPattern
//
//  Created by Mike Pujol on 4/16/20.
//  Copyright © 2020 Mike Pujol. All rights reserved.
//

import UIKit

class BaseCoordinator: RootViewCoordinator {

    lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.modalPresentationStyle = .fullScreen
        return navigationController
    }()

    var rootViewController: UIViewController {
        return navigationController
    }

    var childCoordinators: [Coordinator] = []

    func start() {
        // noop
    }


}
