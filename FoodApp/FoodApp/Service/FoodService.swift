//
//  FoodService.swift
//  FoodApp
//
//  Created by Kirill Khudyakov on 17.05.2018.
//  Copyright © 2018 Kirill Khudiakov. All rights reserved.
//

import Foundation
import Moya

class FoodService: MoyaProvider<API> {
    
    func getFoods(onSuccess: @escaping ([Food])->Void )  {
        request(.getFoods) { result in
            switch (result) {
            case let .success(response):
                do {
                    let foods = try JSONDecoder().decode([Food].self, from: response.data)
                    onSuccess(foods)
                } catch {
                    print("error parsing:", error.localizedDescription)
                }
                
                break
            case .failure(let error):
                print("error: ", error.errorDescription ?? "")
                break
            }
        }
    }
    
}
