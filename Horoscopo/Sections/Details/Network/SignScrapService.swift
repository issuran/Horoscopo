//
//  SignScrapService.swift
//  Horoscopo
//
//  Created by Tiago Oliveira on 01/02/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import UIKit

class SignScrapService: ServiceProvider<SignWebScrapAPI> {
    func getSignToday(sign: String,
                        completion: @escaping (Result<SignDetailsModel?>) -> Void) -> Void {
        let provider = ServiceProvider<SignWebScrapAPI>()
        
        do {
            try provider.execute(service: .today(sign: sign), completion: { (result) in
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
            })
        } catch {
            completion(.empty)
        }
    }
}
