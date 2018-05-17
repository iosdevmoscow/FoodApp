//
//  Food.swift
//  FoodApp
//
//  Created by Kirill Khudiakov on 16.05.2018.
//  Copyright © 2018 Kirill Khudiakov. All rights reserved.
//

import Foundation



class FoodImage {
    var main: String?
    var small: String?
}

class Food  {
    var guid: String?
    var index: Int?
    var name: String?
    var description: String?
    var price: Float?
    var images: FoodImage?
    var reviews: Int?
    
    init(name: String) {
        self.name = name
    }
}
