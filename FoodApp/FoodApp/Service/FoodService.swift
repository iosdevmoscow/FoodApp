//
//  FoodService.swift
//  FoodApp
//
//  Created by Kirill Khudyakov on 17.05.2018.
//  Copyright © 2018 Kirill Khudiakov. All rights reserved.
//

import Foundation

class FoodService {
    func getDemo() -> [Food] {
        return [
            Food(name: "One"),
            Food(name: "two tow"),
            Food(name: "Three"),
            Food(name: "Four"),
            Food(name: "Five"),
        ]
    }
}
