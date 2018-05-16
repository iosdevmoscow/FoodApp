//
//  MenuCell.swift
//  FoodApp
//
//  Created by Kirill Khudiakov on 16.05.2018.
//  Copyright © 2018 Kirill Khudiakov. All rights reserved.
//

import UIKit
import SnapKit

class MenuCell: UICollectionViewCell {
    
    var uiTitle: UILabel = {
        let lb = UILabel(frame: .zero)
        return lb
    }()
    
    var underline: UIView = {
       return UIView(frame: .zero)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        build()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        build()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print(frame)
    }
    
    func build() {
        addSubview(uiTitle)
        underline.backgroundColor = UIColor.white
        self.addSubview(underline)
        
        backgroundColor = .clear
        uiTitle.textColor = .white
        uiTitle.font = UIFont.boldSystemFont(ofSize: 14)
        
        uiTitle.snp.makeConstraints{set in
            set.edges.equalToSuperview().inset(4)
        }
        
        underline.snp.makeConstraints { set in
                set.height.equalTo(4)
                set.width.equalToSuperview()
                set.bottom.equalToSuperview()
        }
        
    }
    
    func setup(item: MenuItem) {
        uiTitle.text = item.title
        if item.isActive {
            uiTitle.textColor = .white
            uiTitle.font = UIFont.boldSystemFont(ofSize: 14)
            underline.isHidden = false
        } else {
            uiTitle.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            uiTitle.font = UIFont.systemFont(ofSize: 14)
            underline.isHidden = true
        }
    }
    
}
