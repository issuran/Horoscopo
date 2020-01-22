//
//  AppCoordinator.swift
//  Horoscopo
//
//  Created by Tiago Oliveira on 21/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var window: UIWindow
    var navigationController: UINavigationController
    
    // Home
    var homeCoordinator: HomeCoordinator!
    
    required init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    func start() {
        homeCoordinator = HomeCoordinator(navigationController: navigationController)
        homeCoordinator.start()
    }
}
