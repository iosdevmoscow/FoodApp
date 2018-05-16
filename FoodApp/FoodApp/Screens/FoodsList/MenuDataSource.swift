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
        print(list.count)
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath)
        let menuItem = list[indexPath.row]
        print("\(menuItem.title)")
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 40))
        label.text = menuItem.title
        label.textColor = .white
        label.backgroundColor = .orange
        cell.addSubview(label)
//        label.center = cell.center
        cell.backgroundColor = .red
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}
