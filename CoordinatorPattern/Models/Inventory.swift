//
//  Inventory.swift
//  CoordinatorPattern
//
//  Created by Mike Pujol on 4/16/20.
//  Copyright © 2020 Mike Pujol. All rights reserved.
//

import Foundation

class Inventory {
    var items: [QuestItem]

    var hasBell: Bool {
        return items.contains(.bell)
    }
    var hasGuitar: Bool {
        return items.contains(.guitar)
    }
    var hasPiano: Bool {
        return items.contains(.piano)
    }

    var hasAllItems: Bool {
        return hasBell && hasGuitar && hasPiano
    }

    init(items: [QuestItem] = [QuestItem]()) {
        self.items = items
    }
}



