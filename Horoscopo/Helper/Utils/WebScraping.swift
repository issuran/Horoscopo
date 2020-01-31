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
    
    func testMe() {
        do {

            // 1º Bater no servico para pegar o html do site
                let html = """
            <div class="texto">
                <p>SEX - Algumas coisas podem não sair exatamente como você planejou hoje. Controle sua impaciência, segure a irritação e evite bater de frente com os chefes no serviço. Aposte na criatividade para vencer os desafios e alcançar seus objetivos. Boa sintonia com os amigos. À noite, seu coração vai pedir mais segurança e você só vi investir na paquera se sentir firmeza. Cuide bem de quem ama, sem exagerar no ciúme.</p>
            """
            
            let doc: Document = try SwiftSoup.parse(html)
            let elements = try doc.getElementsByClass("texto")
            let result = try elements.first()?.select("p").first()?.text()
            
            // 2º Retornar result para exibir nos detalhes do signo
            print(result!)
        } catch {
            print("error")
        }
    }
}
