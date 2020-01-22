//
//  Coordinator.swift
//  Horoscopo
//
//  Created by Tiago Oliveira on 21/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

protocol Coordinator {
    var window: UIWindow { get set }
    var navigationController: UINavigationController { get set }
    
    init(window: UIWindow)
    
    func start()
}
