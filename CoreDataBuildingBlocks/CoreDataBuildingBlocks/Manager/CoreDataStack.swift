//
//  CoreDataStack.swift
//  CoreDataBuildingBlocks
//
//  Created by JongHoon on 2022/12/15.
//

import Foundation
import CoreData

class CoreDataStack {
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "CoreDataBlocksModel")
        
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core Data failed to initialize \(error)")
            }
        }
    }
}
