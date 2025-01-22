//
//  MovieDetail+CoreDataProperties.swift
//  banquemisr.challenge05
//
//  Created by Karim  on 1/22/25.
//
//

import Foundation
import CoreData

extension MovieDetail {
    @NSManaged public var id: Int64
    @NSManaged public var title: String
    @NSManaged public var posterPath: String
    @NSManaged public var backdropPath: String
    @NSManaged public var runtime: Int64
    @NSManaged public var releaseDate: String
    @NSManaged public var originalLanguage: String
    @NSManaged public var overview: String
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieDetail> {
        return NSFetchRequest<MovieDetail>(entityName: "MovieDetail")
    }
}

extension MovieDetail : Identifiable {}
