//
//  TileCell.swift
//  FoodApp
//
//  Created by Kirill Khudiakov on 16.05.2018.
//  Copyright © 2018 Kirill Khudiakov. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class TileCell: UICollectionViewCell {
    
    var imageView: UIImageView = {
        return UIImageView(frame: .zero)
    }()
    
    var nameLabel: UILabel = {
        return UILabel(frame: .zero)
    }()
    
    var descLabel: UILabel = {
        return UILabel(frame: .zero)
    }()
    
    var reviewsLabel: UILabel = {
        return UILabel(frame: .zero)
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
    }
    
    func build() {
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(descLabel)
        addSubview(reviewsLabel)
        
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 15)
        
        descLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        descLabel.font = UIFont.systemFont(ofSize: 10)
        
        reviewsLabel.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        reviewsLabel.font = UIFont.systemFont(ofSize: 9)
        reviewsLabel.textAlignment = .right
        
        backgroundColor = .white
        
        // Constraints
        imageView.snp.makeConstraints { set in
            set.width.equalToSuperview()
            set.height.equalTo(132)
            set.top.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints{set in
            set.width.equalToSuperview()
            set.height.equalTo(36)
            set.top.equalTo(imageView.snp.bottom).offset(5)
            set.left.equalToSuperview().offset(10)
        }
        
        descLabel.snp.makeConstraints { set in
            set.height.equalTo(14)
            set.width.equalToSuperview()
            set.top.equalTo(nameLabel.snp.bottom).offset(5)
            set.left.equalToSuperview().offset(10)
        }
        
        reviewsLabel.snp.makeConstraints { set in
            set.width.equalTo(80)
            set.height.equalTo(12)
            set.bottom.equalToSuperview().offset(-10)
            set.right.equalToSuperview().offset(-10)
        }
        
    }
    
    func setup(item: Food) {
        if let url = URL(string: item.images?.small ?? "") {
            let resource = ImageResource(downloadURL: url, cacheKey: "tile_\(item.guid ?? "")")
            imageView.kf.setImage(with: resource)
        }
        nameLabel.text = item.name
        descLabel.text = item.description
        reviewsLabel.text = "reviews \(item.reviews)"
    }
    
}
