//
//  HomeViewModel.swift
//  Horoscopo
//
//  Created by Tiago Oliveira on 21/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import Foundation

class HomeViewModel {
    weak var delegate: HomeCoordinatorDelegate!
    
    let signArray: [String] = ["Áries", "Touro", "Gêmeos", "Câncer",
                               "Leão", "Virgem", "Libra", "Escorpião",
                               "Sagitário", "Capricórnio", "Aquário", "Peixes"]
}
