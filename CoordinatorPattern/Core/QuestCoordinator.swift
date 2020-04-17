//
//  QuestCoordinator.swift
//  CoordinatorPattern
//
//  Created by Mike Pujol on 4/16/20.
//  Copyright © 2020 Mike Pujol. All rights reserved.
//

import Foundation

class QuestCoordinator: BaseCoordinator {

    // Subclass from baseCoordinator

    // Abstract any information being passed from one VC to the other.
    var inventory = Inventory()

    // Handle presentation of the the different QuestVCs
    override func start() {
         switch Int.random(in: 0...2) {
         case 0:
             showBellQuestVC()
         case 1:
             showGuitarQuestVC()
         case 2:
             showPianoQuestVC()
         default:
             break
         }
    }

    func showBellQuestVC() {
        let vc = QuestViewController(activeQuestItem: .bell)
        vc.coordinator = self
        vc.onComplete = onBellComplete
        navigationController.setViewControllers([vc], animated: true)
    }

    func showGuitarQuestVC() {
        let vc = QuestViewController(activeQuestItem: .guitar)
        vc.coordinator = self
        vc.onComplete = onGuitarComplete
        navigationController.setViewControllers([vc], animated: true)
    }

    func showPianoQuestVC() {
        let vc = QuestViewController(activeQuestItem: .piano)
        vc.coordinator = self
        vc.onComplete = onPianoComplete
        navigationController.setViewControllers([vc], animated: true)
    }

    func showOverallCompleteVC() {
        let vc = CompleteViewController()
        vc.coordinator = self
        vc.onComplete = onOverallComplete
        navigationController.setViewControllers([vc], animated: true)
    }

    // Add completion methods
    func onBellComplete() {
        showNextStage()
    }

    func onGuitarComplete() {
        showNextStage()
    }

    func onPianoComplete() {
        showNextStage()
    }

    func onOverallComplete() {
        completeFlow()
    }

    func showNextStage() {
         switch (inventory.hasBell, inventory.hasGuitar ,inventory.hasPiano) {
         case (false, _, _):
             showBellQuestVC()
         case (_, false, _):
             showGuitarQuestVC()
         case (_, _, false):
             showPianoQuestVC()
         case (true, true, true):
             showOverallCompleteVC()
         }
     }

    // Wrap it up
    func completeFlow() {
        rootViewController.dismiss(animated: true, completion: nil)
        CoordinatorManager.shared.deallocateCurrentCoordinator()

    }

}
