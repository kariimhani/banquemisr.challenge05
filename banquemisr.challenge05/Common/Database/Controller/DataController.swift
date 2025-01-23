//
//  DataController.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/21/25.
//

import UIKit
import CoreData

final class DataController: DataControllerContract {
    private let container: NSPersistentContainer
    
    private var context: NSManagedObjectContext  {
        container.viewContext
    }
    
    init(container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer) {
        guard let container else {
            fatalError("Failed to load Container")
        }
        
        self.container = container
    }
    
    func fetch<T>(_ request: NSFetchRequest<T>) throws -> T? {
        try context.fetch(request).first
    }
    
    func fetch<T>(_ request: NSFetchRequest<T>) throws -> [T] {
        try context.fetch(request)
    }
    
    func insert<T: NSManagedObject>(_ type: T.Type, configure: (T) -> Void) {
        let entity = T(context: context)
        configure(entity)
        context.insert(entity)
    }
    
    func save() {
        context.perform { [weak self] in
            if self?.context.hasChanges ?? false {
                do {
                    try self?.context.save()
                } catch {
                    debugPrint("Error: \(error.localizedDescription)")
                }
            }
        }
    }
}
