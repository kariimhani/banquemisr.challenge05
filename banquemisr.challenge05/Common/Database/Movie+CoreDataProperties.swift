//
//  Movie+CoreDataProperties.swift
//  banquemisr.challenge05
//
//  Created by Karim on 1/21/25.
//
//

import Foundation
import CoreData

extension Movie {
    @NSManaged public var id: Int64
    @NSManaged public var title: String
    @NSManaged public var voteCount: Int
    @NSManaged public var overview: String
    @NSManaged public var posterPath: String
    @NSManaged public var releaseDate: String
    @NSManaged public var voteAverage: Double
    @NSManaged public var backdropPath: String
    @NSManaged public var type: String
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }
}

extension Movie : Identifiable {}
