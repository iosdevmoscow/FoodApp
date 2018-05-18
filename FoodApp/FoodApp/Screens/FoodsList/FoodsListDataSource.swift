//
//  FoodsListDataSource.swift
//  FoodApp
//
//  Created by Kirill Khudiakov on 16.05.2018.
//  Copyright © 2018 Kirill Khudiakov. All rights reserved.
//

import UIKit

class FoodsListDataSource: NSObject, UICollectionViewDataSource {
    
    var list: [Food] = []
    var filterCriteria: Int = 0
    
    var filteredList: [Food] {
        if filterCriteria == 0 {
            return list
        } else {
            return list.filter { ($0.index ?? 1)  < filterCriteria }
        }
    }
    
    convenience init(items: [Food]) {
        self.init()
        list = items
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tileCell", for: indexPath) as! TileCell
        cell.setup(item: filteredList[indexPath.row])
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}


