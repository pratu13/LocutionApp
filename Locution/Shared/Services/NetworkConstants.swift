//
//  NetworkConstants.swift
//  Locution
//
//  Created by pratyush on 8/10/22.
//

import Foundation

//https://api.dictionaryapi.dev/api/v2/entries/en/

enum NetworkConstant {
    
    case search(String)
    
    var word: String {
        switch self {
        case .search(let term):
            return "https://api.dictionaryapi.dev/api/v2/entries/en/\(term)"
        }
    }
}
