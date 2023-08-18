//
//  TabBarViewController.swift
//  DeliveryStoreApp
//
//  Created by Анастасия Романова on 8/15/23.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
// MARK: - UI
    private lazy var headerView: HeaderView = {
        return HeaderView().configure()
    }()
// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        setUpNavigation()
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
    }
// MARK: - ViewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBar.tintColor = .systemGreen
        
        configureUI()
        
        let mainViewController = MainViewControllerImpl()
        let mainViewControllerIcon = UITabBarItem(
            title: "Главная",
            image: UIImage(named: "SparTabBarIcon"),
            selectedImage: UIImage(named: "otherImage.png")
        )
        
        mainViewController.tabBarItem = mainViewControllerIcon
        
        let catalogViewController = CatalogViewController()
        let catalogViewControllerIcon = UITabBarItem(
            title: "Каталог",
            image: UIImage(named: "CatalogTabBar"),
            selectedImage: UIImage(named: "otherImage.png")
        )
        
        catalogViewController.tabBarItem = catalogViewControllerIcon
        
        let basketViewController = BasketViewController()
        let basketViewControllerIcon = UITabBarItem(
            title: "Корзина",
            image: UIImage(named: "CartTabBar"),
            selectedImage: UIImage(named: "otherImage.png")
        )
        
        basketViewController.tabBarItem = basketViewControllerIcon
        
        let profileViewController = ProfileViewController()
        let profileViewControllerIcon = UITabBarItem(
            title: "Профиль",
            image: UIImage(named: "profile"),
            selectedImage: UIImage(named: "otherImage.png")
        )
        
        profileViewController.tabBarItem = profileViewControllerIcon
        
        view.backgroundColor = .white
        
        let controllers = [mainViewController, catalogViewController, basketViewController, profileViewController]
        self.viewControllers = controllers
        
        self.selectedIndex = 0
    }
    
// MARK: - SetupNavigationBar
    func setUpNavigation() {
        self.navigationController?.navigationBar.barTintColor = .white
    }
    
// MARK: - ConfigureUI
    func configureUI(){
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.addSubview(headerView)
            
            headerView.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor, constant: 0).isActive = true
            headerView.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor, constant: 0).isActive = true
            headerView.topAnchor.constraint(equalTo: navigationBar.topAnchor, constant: -24).isActive = true
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
