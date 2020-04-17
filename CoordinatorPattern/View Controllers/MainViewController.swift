//
//  MainViewController.swift
//  CoordinatorPattern
//
//  Created by Mike Pujol on 4/16/20.
//  Copyright © 2020 Mike Pujol. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.setNavigationBarHidden(true, animated: false)
        startButton.layer.cornerRadius = startButton.frame.height / 2

    }

    @IBAction func startButtonPressed(_ sender: UIButton) {
        let navigationViewController = UINavigationController(rootViewController: QuestViewController(inventory: Inventory(), activeQuestItem: .bell))
        navigationViewController.modalPresentationStyle = .fullScreen
        navigationController?.present(navigationViewController, animated: true, completion: nil)

        /// What do we want to do?
        /// 1. Abstract all navigation logic
        /// 2. Remove unnecessary passing of information
        /// 
        /// What do we need?
        /// - Coordinator 
        /// - Factory (Optional)
        /// - Manager (Kinda need it if used in the Redfin App)
        ///
        /// This will be where we create coordinator
        /// we just need to ensure it has reference throughout the flow
        ///
    }

}
