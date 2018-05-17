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
    var small: String = "https://placehold.it/163x132"
}

class Food  {
    var guid: String?
    var index: Int?
    var name: String?
    var description: String = "text"
    var price: Float?
    var images: FoodImage?
    var reviews: Int = 214
    
    init(name: String) {
        self.name = name
        self.images = FoodImage()
    }
}
