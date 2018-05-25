//
//  MenuDataSource.swift
//  FoodApp
//
//  Created by Kirill Khudiakov on 16.05.2018.
//  Copyright © 2018 Kirill Khudiakov. All rights reserved.
//

import UIKit

struct MenuItem {
    var title: String
    var isActive: Bool
}

class MenuDataSource: NSObject, UICollectionViewDataSource {
    
    var list: [MenuItem] = []
    
    convenience init(items: [MenuItem]) {
        self.init()
        list = items
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MenuCell
        cell.setup(item: list[indexPath.row])
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}

extension MenuDataSource {
    
    func selectItem(by index: Int) {
        list.enumerated().forEach {
            list[$0.offset].isActive = false
        }
        list[index].isActive = true
    }
}
