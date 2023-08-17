//
//  AppCoordinator.swift
//  DeliveryStoreApp
//
//  Created by Анастасия Романова on 8/15/23.
//

import UIKit

protocol AppCoordinator: AnyObject {

    var navigationController: UINavigationController { get }
    
    func startScreen()
}

final class AppCoordinatorImp: AppCoordinator {
    
    let navigationController = UINavigationController()
    
    private let host: String

    init(host: String) {
        self.host = host
    }
    
    func startScreen() {
        let tabBarViewController = TabBarViewController()

        navigationController.pushViewController(tabBarViewController, animated: false)
    }
}
