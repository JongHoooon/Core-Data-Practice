//
//  CoreDataManager.swift
//  CoreDataBuildingBlocks
//
//  Created by JongHoon on 2022/12/15.
//

import Foundation
import CoreData

class CoreDataManager {
    
    
    // before iOS 10
    lazy var managedObjectModel: NSManagedObjectModel = {
       
        guard let url = Bundle.main.url(forResource: "CoreDataBlocksModel", withExtension: "momd") else {
            fatalError("Failed to locate the CoreDataBlockModel file!")
        }
        
        guard let model = NSManagedObjectModel(contentsOf: url) else {
            fatalError("Failed to load model!")
        }
        
        return model
    }()
    
}

