//
//  SignDetailsViewModel.swift
//  Horoscopo
//
//  Created by Tiago Oliveira on 24/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import Foundation

protocol SignDetailsResultProtocol: AnyObject {
    func success(model: SignDetailsModel?)
    func failure(error: ServiceError)
}

class SignDetailsViewModel {
    
    let service = SignService()
    var signDetailsModel: SignDetailsModel?
    weak var delegate: SignDetailsResultProtocol!
    
    var signDetails: String
    
    init(_ signDetails: String) {
        self.signDetails = signDetails
    }
    
    func getSignDetails() {
        var signFixed = signDetails.lowercased()
        signFixed = signFixed.folding(options: .diacriticInsensitive, locale: .current)
        service.getSignToday(sign: signFixed) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let data, _):
                self.delegate.success(model: data)
            case .failure(_):
                print("Failure")
            case .empty:
                print("Empty")
            }
        }
    }
}
