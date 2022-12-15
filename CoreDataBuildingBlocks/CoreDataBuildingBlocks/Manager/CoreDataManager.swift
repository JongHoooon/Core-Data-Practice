//
//  CoreDataManager.swift
//  CoreDataBuildingBlocks
//
//  Created by JongHoon on 2022/12/15.
//

import Foundation
import CoreData

class CoreDataManager {
    
    lazy var managedObjectModel: NSManagedObjectModel = {
       
        guard let url = Bundle.main.url(forResource: "CoreDataBlocksModel", withExtension: "momd") else {
            fatalError("Failed to locate the CoreDataBlockModel file!")
        }
        
        guard let model = NSManagedObjectModel(contentsOf: url) else {
            fatalError("Failed to load model!")
        }
        
        return model
    }()
    
    lazy var coordinator: NSPersistentStoreCoordinator = {
       
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory,
                                                          in: .userDomainMask).first!
        let sqlitePath = documentsDirectory.appendingPathComponent("CoreDataBlocks.sqlite")
        
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType,
                                               configurationName: nil,
                                               at: sqlitePath,
                                               options: nil)
        } catch {
            fatalError("Failed to create coordinator")
        }
        
        return coordinator
    }() 
}
