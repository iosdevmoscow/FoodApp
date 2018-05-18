//
//  FoodsListViewController.swift
//  FoodApp
//
//  Created by Kirill Khudiakov on 15.05.2018.
//  Copyright © 2018 Kirill Khudiakov. All rights reserved.
//

import UIKit

class FoodsListViewController: UIViewController {

    var querySearchField: UITextField!
    var headerView: UIView!
    var menuDataSource: MenuDataSource!
    var listDataSource: FoodsListDataSource!
    var foodsCollectionView: UICollectionView!
    
    var list: [MenuItem] {
        return self.getMenuItems()
    }
    
    convenience init(viewModel: String) {
        self.init()
        listDataSource = FoodsListDataSource(items: [])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addHeader()
        addContent()
        
        FoodService().getFoods { [weak self] foods in
            self?.updateFoodsDataSource(by: foods)
        }
        
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func updateFoodsDataSource(by foods: [Food]) {
        listDataSource = FoodsListDataSource(items: foods)
        foodsCollectionView.dataSource = listDataSource
        foodsCollectionView.reloadData()
    }
    
    func addHeader() {
        headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 120))
        headerView.backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.3215686275, blue: 0.1294117647, alpha: 1)
        view.addSubview(headerView)
        addLeftIcon()
        addSortButtons()
        view.addSubview(querySearchField)
        querySearchField.center.y = 50
        querySearchField.center.x = view.frame.width/2
        
        addCategoriesMenu()
    }
    
    fileprivate func addLeftIcon() {
        let rect = CGRect(x: 0, y: 0, width: view.frame.width - 20, height: 48)
        querySearchField = UITextField(frame: rect)
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
    }
    
    fileprivate func  addSortButtons() {
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
        let tilesImageView = UIImageView(image: #imageLiteral(resourceName: "icon_tiles"))
        let blocksImageView = UIImageView(image: #imageLiteral(resourceName: "icon_blocks"))
        tilesImageView.center = rightView.center
        tilesImageView.center.x -= 20
        tilesImageView.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        blocksImageView.tintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        blocksImageView.center = rightView.center
        rightView.addSubview(tilesImageView)
        rightView.addSubview(blocksImageView)
        querySearchField.rightViewMode = .always
        querySearchField.rightView = rightView
    }
    
    func addCategoriesMenu() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
        layout.estimatedItemSize = CGSize(width: 80, height: 40)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 80, width: view.frame.width, height: 50), collectionViewLayout: layout)
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: "menuCell")
        collectionView.backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.3215686275, blue: 0.1294117647, alpha: 1)
        
        menuDataSource = MenuDataSource(items: self.getMenuItems())
        collectionView.dataSource = menuDataSource
        view.addSubview(collectionView)
    }
    
    fileprivate func getMenuItems() -> [MenuItem] {
        return [
            MenuItem(title: "Nearby", isActive: true),
            MenuItem(title: "Popular", isActive: false),
            MenuItem(title: "Top review", isActive: false),
            MenuItem(title: "Favorites", isActive: false),
        ]
    }
    
    func addContent() {
        addFoodsListComponent()
    }
    
    func addFoodsListComponent() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: 150, height: 225)
        layout.scrollDirection = .vertical
        
        foodsCollectionView = UICollectionView(frame: CGRect(x: 0, y: 140, width: view.frame.width, height: view.frame.height - 120 - 22), collectionViewLayout: layout)
        foodsCollectionView.register(TileCell.self, forCellWithReuseIdentifier: "tileCell")
        foodsCollectionView.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9725490196, alpha: 1)
        foodsCollectionView.dataSource = listDataSource
        foodsCollectionView.delegate = self
        view.addSubview(foodsCollectionView)
    }
    
}

extension FoodsListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detail = FoodDetailViewController(model: listDataSource.list[indexPath.row])
        present(detail, animated: true)
    }
}

