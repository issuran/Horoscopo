//
//  HomeCoordinator.swift
//  Horoscopo
//
//  Created by Tiago Oliveira on 21/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

class HomeCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    
    var homeViewModel: HomeViewModel!
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        homeViewModel = HomeViewModel()
        homeViewModel.delegate = self
        let homeViewController = HomeViewController(viewModel: homeViewModel)
        navigationController.navigationBar.isHidden = true
        navigationController.setViewControllers([homeViewController], animated: true)
    }
}

extension HomeCoordinator: HomeCoordinatorDelegate {
    func callDetails(_ viewModel: HomeViewModel, _ signTitle: String) {
        let detailsModel = SignDetailsViewModel(signTitle)
        let details = SignDetailsViewController(viewModel: detailsModel)
        
        navigationController.pushViewController(details, animated: true)
    }
}
