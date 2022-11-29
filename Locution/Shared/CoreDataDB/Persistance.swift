//
//  Persistance.swift
//  Locution
//
//  Created by Pratyush  on 4/13/21.
//

import Foundation
import CoreData

struct PersistanceController {
    
    static let shared = PersistanceController()
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Words")
        container.loadPersistentStores { (description, error) in
            if let error = error as NSError? {
                fatalError("Unresolved Error \(error)")
            }
        }
    }
    
}
