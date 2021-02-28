//
//  AppCoordinator.swift
//  MVVMRxSwift
//
//  Created by Ignacio Arias on 2021-02-27.
//

import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let viewController = ViewController.instantiate(viewModel: RestaurantsListViewModel())
        let navigationController = UINavigationController(rootViewController: viewController)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
