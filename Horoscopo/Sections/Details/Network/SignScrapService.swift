//
//  SignScrapService.swift
//  Horoscopo
//
//  Created by Tiago Oliveira on 01/02/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

class SignScrapService: Provider {
    
    let provider = Provider()
    
    func getSignToday(sign: String,
                      completion: @escaping (Result<SignDetailsModel?>) -> Void) -> Void {
        
        do {
            try provider.execute(endpoint: SignWebScrapAPI.today(sign: sign)) { (result) in
                switch result {
                case .success(let data, let response):
                    let html = String(data: data, encoding: String.Encoding.utf8)
                    let model = WebScraping.shared.performWebScraping(html: html)
                    completion(.success(model, response))
                case .failure(let error):
                    completion(.failure(error))
                case .empty:
                    completion(.empty)
                }
            }
        } catch {
            completion(.empty)
        }
    }
}
