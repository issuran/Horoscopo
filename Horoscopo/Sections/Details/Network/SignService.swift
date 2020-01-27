//
//  SignService.swift
//  Horoscopo
//
//  Created by Tiago Oliveira on 24/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

class SignService: ServiceProvider<SignAPI> {
    func getSignToday(sign: String,
                      completion: @escaping (Result<SignDetailsModel?>) -> Void) -> Void {
        let provider = ServiceProvider<SignAPI>()
        
        do {
            try provider.execute(service: .today(sign: sign), completion: { (result) in
                switch result {
                case .success(let data, let response):
                    let decoder = JSONDecoder()
                    let model = try! decoder.decode(SignDetailsModel.self, from: data)
                    completion(.success(model, response))
                case .failure(let error):
                    completion(.failure(error))
                case .empty:
                    completion(.empty)
                }
            })
        } catch {
            completion(.empty)
        }
    }
}
