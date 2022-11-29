//
//  AppModel.swift
//  Locution
//
//  Created by Pratyush  on 4/13/21.
//

import Foundation
import CoreData

struct Words: Hashable, Identifiable {
    var id = UUID()
    let title: String
    let meaning: String
    
    init(word: Word) {
        title = word.title ?? ""
        meaning = word.meaning ?? ""
    }
    
    init() {
        title = "Clandestine"
        meaning = "secretive"
    }
}
