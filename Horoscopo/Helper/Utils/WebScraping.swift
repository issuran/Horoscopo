//
//  WebScraping.swift
//  Horoscopo
//
//  Created by Tiago Oliveira on 30/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import Foundation
import SwiftSoup

class WebScraping {
    class var shared: WebScraping {
        struct Static {
            static let instance: WebScraping = WebScraping()
        }
        return Static.instance
    }
    
    func performWebScraping(html: String?) -> SignDetailsModel {
        guard let html = html else { return SignDetailsModel(texto: "Infelizmente não conseguimos resposta das estrelas\n\n=(", autor: "") }
        do {
            let doc: Document = try SwiftSoup.parse(html)
            let elements = try doc.getElementsByClass("texto")
            let result = try elements.first()?.select("p").first()?.text()
            
            return SignDetailsModel(texto: result!, autor: "João Bidu")
        } catch {
            return SignDetailsModel(texto: "Infelizmente não conseguimos resposta das estrelas\n\n=(", autor: "")
        }
    }
}
