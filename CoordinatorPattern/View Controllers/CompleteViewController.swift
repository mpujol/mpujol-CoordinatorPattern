//
//  CompleteViewController.swift
//  CoordinatorPattern
//
//  Created by Mike Pujol on 4/16/20.
//  Copyright © 2020 Mike Pujol. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {

    var onComplete: (() -> Void)?
    weak var coordinator: QuestCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func completeButtonPressed(_ sender: Any) {
        onComplete?()

    }

}
