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

    let pulseColorArray: [String] = ["#F7B451FF", "#CF814CFF", "#B9843FFF", "#E66B37FF",
                                     "#E46935FF", "#DFAE66FF", "#FDBB2CFF", "#48AED1FF",
                                     "#FDBB2CFF", "#DFAE66FF", "#6FD3EDFF", "#DFAE66FF"]
}
