//
//  MockDataController.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/23/25.
//

import CoreData
@testable import banquemisr_challenge05

class MockDataController: DataControllerContract {
    private let isSuccess: Bool
    private let container: NSPersistentContainer
    private var context: NSManagedObjectContext  {
        container.viewContext
    }
    
    var isInserted: Bool = false
    var isSaved: Bool = false
    
    init(isSuccess: Bool,
         container: NSPersistentContainer? = TestCoreDataStack.shared.persistentContainer) {
        guard let container else {
            fatalError("Failed to load Container")
        }
        
        self.isSuccess = isSuccess
        self.container = container
    }
    
    func fetch<T>(_ request: NSFetchRequest<T>) throws -> T? {
        if isSuccess {
            return try context.fetch(request).first
        }
        
        throw NSError(domain: "MockDataController", code: 123)
    }
    
    func fetch<T>(_ request: NSFetchRequest<T>) throws -> [T] {
        if isSuccess {
            return try context.fetch(request)
        }
        
        throw NSError(domain: "MockDataController", code: 123)
    }
    
    func insert<T: NSManagedObject>(_ type: T.Type, configure: (T) -> Void) {
//        let entity = T(context: context)
//        configure(entity)
//        context.insert(entity)
//
        isInserted = isSuccess
    }
    
    func save() {
        isSaved = isSuccess
    }
}
