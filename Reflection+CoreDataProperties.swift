//
//  Reflection+CoreDataProperties.swift
//  
//
//  Created by Christian Paulo on 16/09/22.
//
//

import Foundation
import CoreData


extension Reflection {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Reflection> {
        return NSFetchRequest<Reflection>(entityName: "Reflection")
    }

    @NSManaged public var date: Date?
    @NSManaged public var emoji: Int16
    @NSManaged public var subject: String?
    @NSManaged public var text_reflexion: String?

}
