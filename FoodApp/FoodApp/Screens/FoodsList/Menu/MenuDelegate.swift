//
//  MenuDelegate.swift
//  FoodApp
//
//  Created by Kirill Khudiakov on 18.05.2018.
//  Copyright © 2018 Kirill Khudiakov. All rights reserved.
//

import UIKit

class MenuDelegate: NSObject, UICollectionViewDelegate {
    
    var onTap: ((Int)->Void)?
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let data = collectionView.dataSource as? MenuDataSource {
            data.selectItem(by: indexPath.row)
            collectionView.reloadData()
            if let tap = onTap {
                tap(indexPath.row)
            }
        }
    }
}
