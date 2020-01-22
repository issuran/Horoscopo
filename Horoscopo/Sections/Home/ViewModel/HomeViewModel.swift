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
    
    let signArray: [String] = ["Aries", "Touro", "Gemeos", "Cancer", "Leao", "Virgem", "Libra", "Escorpiao", "Sagitario", "Capricornio", "Aquario", "Peixes"]
}
