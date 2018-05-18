//
//  ViewController.swift
//  FoodApp
//
//  Created by Kirill Khudiakov on 14.05.2018.
//  Copyright © 2018 Kirill Khudiakov. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    var bgImageView: UIImageView!
    var overlayView: UIView!
    
    var userImageView: UIImageView!
    
    
    convenience init(viewModel: String) {
        self.init()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        addBackground()
        addUser()
        addSearchTitle()
        addForm()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
//        navigationController?.isNavigationBarHidden = false
    }

    func addBackground() {
        bgImageView = UIImageView(image: #imageLiteral(resourceName: "search_bg"))
        bgImageView.center = view.center
        view.addSubview(bgImageView)
        
        overlayView = UIView(frame: view.frame)
        overlayView.center = view.center
        overlayView.alpha = 0.55
        overlayView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.addSubview(overlayView)
    }
    
    func addUser() {
        userImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        userImageView.image = #imageLiteral(resourceName: "user")
        userImageView.contentMode = .scaleAspectFit
        userImageView.center = CGPoint(x: 50, y: 100)
        userImageView.layer.borderWidth = 2
        userImageView.layer.borderColor = UIColor.white.cgColor
        userImageView.layer.cornerRadius = 30
        userImageView.clipsToBounds = true
        view.addSubview(userImageView)
        
        let label = UILabel(frame: CGRect(x: userImageView.center.x + 60, y: userImageView.center.y - 15, width: 200, height: 30))
        label.text = "Hi, Kirill Amigo"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        view.addSubview(label)
    }
    
    func addSearchTitle() {
        let label = UILabel(frame: CGRect(x: 25, y: 140, width: view.frame.width - 20, height: 200))
        label.text = "What food do you want today?"
        label.textColor = .white
        label.font = UIFont.init(name: "American Typewriter", size: 40)
        label.textAlignment = .left
        label.numberOfLines = 3
        view.addSubview(label)
    }
    
    func addForm() {
        let rect = CGRect(x: 0, y: 0, width: view.frame.width - 20, height: 48)
        let querySearchField = UITextField(frame: rect)
        querySearchField.backgroundColor = .white
        querySearchField.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        querySearchField.layer.cornerRadius = 5
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 48, height: 48))
        let searchIcon = UIImageView(image: #imageLiteral(resourceName: "icon_search"))
        searchIcon.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        searchIcon.center = paddingView.center
        paddingView.addSubview(searchIcon)
        querySearchField.leftView = paddingView
        querySearchField.leftViewMode = .always
        querySearchField.placeholder = "Search location"
        view.addSubview(querySearchField)
        
        let buttonSearch = UIButton(frame: rect)
        buttonSearch.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.3333333333, blue: 0.1333333333, alpha: 1)
        buttonSearch.setTitle("SEARCH", for: .normal)
        buttonSearch.setTitleColor(.white, for: .normal)
        buttonSearch.setTitleShadowColor(.black, for: .normal)
        buttonSearch.layer.cornerRadius = 5
        view.addSubview(buttonSearch)
        
        querySearchField.center = CGPoint(x: view.center.x, y: 350)
        buttonSearch.center = CGPoint(x: view.center.x, y: 430)
        buttonSearch.addTarget(self, action: #selector(showFoodsList), for: .touchUpInside)
    }
    
    @objc func showFoodsList() {
        let foodListController = FoodsListViewController(viewModel: "FoodsList")
        foodListController.navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(foodListController, animated: true)
    }
}



