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

class FoodDetailViewController: UIViewController {
    
    var viewModel: Food!
    var mainImageView: UIImageView!
    var mainNameLabel: UILabel!
    var bottomView: UIView!
    var contentView: UIView!
    var buttonFavorite: UIButton!
    var backButton: UIButton!
    
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
    }
    
    func configureUI() {
        mainImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 300))
        if let url = URL(string: viewModel.images.main ?? "") {
            let resource = ImageResource(downloadURL: url, cacheKey: "main_\(viewModel.guid)")
            mainImageView.kf.setImage(with: resource)
        }
        view.addSubview(mainImageView)
        
        backButton = UIButton(type: .custom)
        backButton.setImage(#imageLiteral(resourceName: "icon_back"), for: .normal)
        backButton.tintColor = .white
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        view.addSubview(backButton)
        
        mainNameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 27))
        mainNameLabel.textAlignment = .center
        mainNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(mainNameLabel)
        mainNameLabel.text = viewModel.name ?? ""
        
        bottomView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 48))
        view.addSubview(bottomView)
        
    }
    
    @objc func back() {
        dismiss(animated: true)
    }
    
    
    
}

