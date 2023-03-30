//
//  Entity+CoreDataProperties.swift
//  Machine Test-Aeth analatica
//
//  Created by WC on 29/03/23.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchEntityRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var username: String?
    @NSManaged public var password: String?

}

extension Entity : Identifiable {

}
