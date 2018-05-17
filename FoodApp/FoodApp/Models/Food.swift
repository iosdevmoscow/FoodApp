//
//  Food.swift
//  FoodApp
//
//  Created by Kirill Khudiakov on 16.05.2018.
//  Copyright © 2018 Kirill Khudiakov. All rights reserved.
//

import Foundation



class FoodImage: Codable {
    var main: String?
    var small: String = ""
}

class Food: Codable  {
    var guid: String?
    var index: Int?
    var name: String?
    var price: String?
    var description: String = ""
    var images: FoodImage
    var reviews: Int?
    
    init(name: String) {
        self.name = name
        self.images = FoodImage()
    }
}

