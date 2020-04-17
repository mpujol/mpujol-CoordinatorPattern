//
//  CoordinatorManager.swift
//  CoordinatorPattern
//
//  Created by Mike Pujol on 4/16/20.
//  Copyright © 2020 Mike Pujol. All rights reserved.
//

import Foundation


// Create a Factory and a manager
struct CoordinatorFactory {
    static func createQuestCoordinator() -> QuestCoordinator {
        return QuestCoordinator()
    }
}

class CoordinatorManager: NSObject {
    static let shared = CoordinatorManager()

    var currentCoordinator: RootViewCoordinator?

    init(currentCoordinator: RootViewCoordinator? = nil) {
        self.currentCoordinator = currentCoordinator
        super.init()
    }

    func deallocateCurrentCoordinator() {
        currentCoordinator = nil
    }
}
