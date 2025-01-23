//
//  TestCoreDataStack.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/23/25.
//

import CoreData

class TestCoreDataStack {
    static var shared: TestCoreDataStack = TestCoreDataStack()
    
    let persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "banquemisr_challenge05")
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        persistentContainer.persistentStoreDescriptions = [description]
        
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load persistent stores: \(error)")
            }
        }
    }
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}
