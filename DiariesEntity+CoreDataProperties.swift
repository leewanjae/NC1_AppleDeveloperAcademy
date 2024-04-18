//
//  DiariesEntity+CoreDataProperties.swift
//  TheManU
//
//  Created by LeeWanJae on 4/16/24.
//
//

import Foundation
import CoreData


extension DiariesEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DiariesEntity> {
        return NSFetchRequest<DiariesEntity>(entityName: "DiariesEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var context: String?
    @NSManaged public var listTitle: String?

}

extension DiariesEntity : Identifiable {

}
