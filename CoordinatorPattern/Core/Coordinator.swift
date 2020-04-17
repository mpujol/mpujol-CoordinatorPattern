//
//  Coordinator.swift
//  CoordinatorPattern
//
//  Created by Mike Pujol on 4/16/20.
//  Copyright © 2020 Mike Pujol. All rights reserved.
//

import UIKit

// Create Root View Controller Provider
protocol RootViewControllerProvider {
    /// The coordinators 'rootViewController'. It helps to think of this as the view
    /// controller that can be used to dismiss the coordinator from the view hierarchy.
    var rootViewController: UIViewController { get }
}

// Create Coordinator class
protocol Coordinator: class {

    /// This is a common requirement for coordinators but since we aren't implementing this app-wide
    /// we most likely will set to empty till you intend on nesting it at some point in the future
    var childCoordinators: [Coordinator] { get set }
    func start()
}

// Create coordinator extension
extension Coordinator {
    func addChildCoordinator(childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }

    func removeChildCoordinators(childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }
}
// Create a type alias for the two
typealias RootViewCoordinator = Coordinator & RootViewControllerProvider
