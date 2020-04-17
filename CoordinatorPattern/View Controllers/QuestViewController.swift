//
//  QuestViewController.swift
//  CoordinatorPattern
//
//  Created by Mike Pujol on 4/16/20.
//  Copyright © 2020 Mike Pujol. All rights reserved.
//

import UIKit

class QuestViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet var bellImageView: UIImageView!
    @IBOutlet var guitarImageView: UIImageView!
    @IBOutlet var pianoImageView: UIImageView!
    @IBOutlet var ctaButton: UIButton!
    @IBOutlet var currentQuestItemImageView: UIImageView!

    var activeQuestItem: QuestItem
    var inventory: Inventory

    // MARK: - Init
    init(inventory: Inventory, activeQuestItem: QuestItem) {
        self.activeQuestItem = activeQuestItem
        self.inventory = inventory
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - VLC
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.setNavigationBarHidden(true, animated: true)
        setupViews()
    }

    // MARK: - Actions
    @IBAction func claimButtonPressed(_ sender: Any) {
        updateInventory(with: activeQuestItem)
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else { return }
            self.ctaButton.backgroundColor = UIColor(red: 116/255, green: 188/255, blue: 48/255, alpha: 1.0)
            self.ctaButton.isEnabled = true
        }
    }
    @IBAction func ctaButtonPressed(_ sender: UIButton) {
        presentNextStage()
    }

    // MARK: - Helper Methods
    func setupViews() {
        setupInventoryViews()
        updateActiveQuestImageView(activeQuestItem: activeQuestItem)
    }
    func setupInventoryViews() {
        if inventory.hasBell {
            bellImageView.alpha = 1.0
        }
        if inventory.hasGuitar {
            guitarImageView.alpha = 1.0
        }
        if inventory.hasPiano {
            pianoImageView.alpha = 1.0
        }
    }
    func updateActiveQuestImageView(activeQuestItem: QuestItem) {
        var imageName = ""
        switch activeQuestItem {
        case .bell:
            imageName = "bell"
        case .guitar:
            imageName = "guitar"
        case .piano:
            imageName = "piano"
        }
        currentQuestItemImageView.image = UIImage(named: imageName)
    }


    func updateInventory(with questItem: QuestItem) {
        inventory.items.append(questItem)
        setupInventoryViews()
    }
    func presentNextStage() {

        if activeQuestItem == .bell {
        navigationController?.pushViewController(QuestViewController(inventory: inventory, activeQuestItem: .guitar), animated: true)
        }

        if activeQuestItem == .guitar {
            navigationController?.pushViewController(QuestViewController(inventory: inventory, activeQuestItem: .piano), animated: true)
        }

        if activeQuestItem == .piano && inventory.hasAllItems {
            navigationController?.pushViewController(CompleteViewController(), animated: true)
        }
    }
}
