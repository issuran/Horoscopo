//
//  HomeCoordinatorDelegate.swift
//  Horoscopo
//
//  Created by Tiago Oliveira on 21/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import Foundation

protocol HomeCoordinatorDelegate: AnyObject {
    func callDetails(_ viewModel: HomeViewModel, _ signTitle: String)
}
