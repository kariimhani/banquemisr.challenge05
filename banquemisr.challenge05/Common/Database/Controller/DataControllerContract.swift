//
//  DataControllerContract.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/23/25.
//

import CoreData

protocol DataControllerContract {
    func fetch<T>(_ request: NSFetchRequest<T>) throws -> T?
    func fetch<T>(_ request: NSFetchRequest<T>) throws -> [T]
    func insert<T: NSManagedObject>(_ type: T.Type, configure: (T) -> Void)
    func save()
}
