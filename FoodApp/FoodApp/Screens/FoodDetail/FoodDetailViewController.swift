//
//  FoodDetailViewController.swift
//  FoodApp
//
//  Created by Kirill Khudiakov on 17.05.2018.
//  Copyright © 2018 Kirill Khudiakov. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher
import Cosmos

class FoodDetailViewController: UIViewController {
    
    var viewModel: Food!
    var mainImageView: UIImageView!
    var mainNameLabel: UILabel!
    var separatorLabel: UILabel!
    var bottomView: UIView!
    var contentView: UITextView!
    var favoriteButton: UIButton!
    var backButton: UIButton!
    var shareButton: UIButton!
    var reviewsLabel: UILabel!
    var cosmosView: CosmosView!
    
    convenience init(model: Food) {
        self.init()
        viewModel = model
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addConstraints()
    }
    
    func addConstraints() {
        mainNameLabel.snp.makeConstraints { set in
            set.width.equalToSuperview()
            set.height.equalTo(27)
            set.top.equalTo(mainImageView.snp.bottom)
        }
        
        backButton.snp.makeConstraints { set in
            set.top.equalTo(mainImageView.snp.top).offset(40)
            set.left.equalTo(mainImageView.snp.left).offset(20)
        }
        
        shareButton.snp.makeConstraints { set in
            set.top.equalTo(mainImageView.snp.top).offset(40)
            set.right.equalTo(mainImageView.snp.right).inset(20)
        }
        
        separatorLabel.snp.makeConstraints { set in
            set.width.equalToSuperview()
            set.height.equalTo(17)
            set.top.equalTo(mainNameLabel.snp.bottom)
        }
        
        bottomView.snp.makeConstraints { set in
            set.height.equalTo(48)
            set.width.equalToSuperview()
            set.left.equalTo(0)
            set.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { set in
            set.top.equalTo(separatorLabel.snp.bottom)
            set.left.equalToSuperview()
            set.right.equalToSuperview()
            set.bottom.equalTo(bottomView.snp.top)
        }
        
        cosmosView.snp.makeConstraints { set in
            set.left.equalTo(0).offset(20)
            set.width.equalTo(72)
            set.centerY.equalTo(bottomView.snp.centerY)
            set.height.equalTo(20)
            
        }
        
        favoriteButton.snp.makeConstraints { set in
            set.right.equalToSuperview().inset(20)
            set.top.equalTo(bottomView.snp.top).offset(10)
            set.width.equalTo(32)
            set.height.equalTo(32)
        }
        
        reviewsLabel.snp.makeConstraints { set in
            set.left.equalTo(cosmosView.snp.right).offset(30)
            set.right.equalTo(favoriteButton.snp.left).offset(-30)
            set.centerY.equalTo(bottomView.snp.centerY)
            set.height.equalTo(20)
        }
        
    }
    
    func configureUI() {
        view.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        
        mainImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 300))
        if let url = URL(string: viewModel.images.main ?? "") {
            let resource = ImageResource(downloadURL: url, cacheKey: "main_\(viewModel.guid ?? "guid")")
            mainImageView.kf.setImage(with: resource)
        }
        mainImageView.contentMode = .scaleAspectFill
        view.addSubview(mainImageView)
        
        backButton = UIButton(type: .custom)
        backButton.setImage(#imageLiteral(resourceName: "icon_back"), for: .normal)
        backButton.tintColor = .white
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        view.addSubview(backButton)
        
        shareButton = UIButton(type: .custom)
        shareButton.setImage(#imageLiteral(resourceName: "icon_share"), for: .normal)
        shareButton.tintColor = .white
        shareButton.addTarget(self, action: #selector(share), for: .touchUpInside)
        view.addSubview(shareButton)
        
        mainNameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 27))
        mainNameLabel.textAlignment = .center
        mainNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        mainNameLabel.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        view.addSubview(mainNameLabel)
        mainNameLabel.text = viewModel.name ?? ""
        
        separatorLabel = UILabel(frame: .zero)
        separatorLabel.text = "----- Description -----"
        separatorLabel.textColor = .black
        separatorLabel.textAlignment = .center
        separatorLabel.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        separatorLabel.font = UIFont.systemFont(ofSize: 12)
        view.addSubview(separatorLabel)
        
        contentView = UITextView(frame: .zero)
        contentView.text = viewModel.description
        contentView.textColor = #colorLiteral(red: 0.6078431373, green: 0.6078431373, blue: 0.6078431373, alpha: 1)
        contentView.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        view.addSubview(contentView)

        bottomView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 48))
        bottomView.backgroundColor = .white
        view.addSubview(bottomView)
        
        favoriteButton = UIButton(type: .custom)
        favoriteButton.setImage(#imageLiteral(resourceName: "icon_favorite"), for: .normal)
        favoriteButton.tintColor = .white
        favoriteButton.backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.3215686275, blue: 0.1294117647, alpha: 1)
        favoriteButton.layer.cornerRadius = 32 / 2
        favoriteButton.addTarget(self, action: #selector(addToFavorite), for: .touchUpInside)
        view.addSubview(favoriteButton)
        
        reviewsLabel = UILabel(frame: .zero)
        reviewsLabel.text = "\(viewModel.reviews ?? 0) reviews"
        reviewsLabel.textColor = #colorLiteral(red: 0.6078431373, green: 0.6078431373, blue: 0.6078431373, alpha: 1)
        reviewsLabel.textAlignment = .right
        reviewsLabel.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(reviewsLabel)
        
        var cosmosSettings = CosmosSettings()
        cosmosSettings.totalStars = 5
        cosmosSettings.starSize = 20
        cosmosSettings.updateOnTouch = false

        cosmosView = CosmosView(settings: cosmosSettings)
        cosmosView.rating = (Double(viewModel.reviews ?? 1) * 0.1) / 5
        
        view.addSubview(cosmosView)
    }
    
    @objc func back() {
        dismiss(animated: true)
    }
    
    @objc func share() {
        let alert = UIAlertController(title: "Actions", message: "It's action sheet", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Action 1", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Action 2", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    @objc func addToFavorite() {
        let alert = UIAlertController(title: "Dish added to your favorites", message: "It's action", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
}

