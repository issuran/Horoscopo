//
//  BaseCoordinator.swift
//  Horoscopo
//
//  Created by Tiago Oliveira on 21/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

protocol BaseCoordinator {
    var navigationController: UINavigationController { get set }
    
    init(navigationController: UINavigationController)
    
    func start()
}

extension BaseCoordinator {
    func start() {}
}
