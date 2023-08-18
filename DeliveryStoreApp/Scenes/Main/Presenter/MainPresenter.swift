//
//  MainPresenter.swift
//  DeliveryStoreApp
//
//  Created by Анастасия Романова on 8/15/23.
//

import Foundation

protocol MainPresenter: AnyObject {
   
}

final class MainPresenterImpl {
    
    private weak var viewController: MainViewController?
    private weak var appCoordinator: AppCoordinator?
    
    init(
        viewController: MainViewController,
        appCoordinator: AppCoordinator
        
    ) {
        self.viewController = viewController
        self.appCoordinator = appCoordinator
    }
}

// MARK: - MainPresenter
extension MainPresenterImpl: MainPresenter {
    
}
