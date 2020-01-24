//
//  SignAPI.swift
//  Horoscopo
//
//  Created by Tiago Oliveira on 24/01/20.
//  Copyright © 2020 Tiago Oliveira. All rights reserved.
//

import Foundation

enum SignAPI {
    case today(sign: String)
}

extension SignAPI: ServiceProtocol {
    
    var scheme: String {
        return "http"
    }
    
    var host: String {
        return "babi.hefesto.io"
    }
    
    var method: HttpMethod {
        switch self {
        case .today:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .today(let sign):
            return "/signo/\(sign)/dia"
        }
    }
    
    var task: HttpTask {
        return .request
    }
}
