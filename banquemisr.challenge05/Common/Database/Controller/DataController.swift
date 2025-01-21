//
//  DataController.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/21/25.
//

import CoreData
import UIKit

final class DataController {
    private let container: NSPersistentContainer
    
    var context: NSManagedObjectContext  {
        container.viewContext
    }
    
    init() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
        else {
            fatalError("Failed to load AppDelegate")
        }
        
        container = appDelegate.persistentContainer
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
