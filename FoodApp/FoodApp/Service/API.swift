//
//  API.swift
//  FoodApp
//
//  Created by Kirill Khudiakov on 17.05.2018.
//  Copyright © 2018 Kirill Khudiakov. All rights reserved.
//

import Foundation
import Moya

enum API {
    case getFoods
}

extension API: TargetType {
    var baseURL: URL { return URL(string: "https://adeveloper.ru/api/FoodApp")! }
    var path: String {
        switch self {
        case .getFoods:
            return "/foods.json"
        }
    }
    var method: Moya.Method {
        switch self {
        case .getFoods:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .getFoods:
            return .requestPlain
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
