//
//  FoodsListViewController.swift
//  FoodApp
//
//  Created by Kirill Khudiakov on 15.05.2018.
//  Copyright © 2018 Kirill Khudiakov. All rights reserved.
//

import UIKit

class FoodsListViewController: UIViewController {

    convenience init(viewModel: String) {
        self.init()

    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addHeader()
        addContent()
        view.backgroundColor = .white
        
    }
    
    func addHeader() {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 160))
        headerView.backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.3215686275, blue: 0.1294117647, alpha: 1)
        view.addSubview(headerView)
        
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
        querySearchField.rightViewMode = .always
        
//        let rightView = UIView(frame: CGRect(x: 0, y: ))
//        querySearchField.rightView =
        view.addSubview(querySearchField)
        querySearchField.center.y = 50
        querySearchField.center.x = view.frame.width/2
    }
    
    func addContent() {
        
    }

}
