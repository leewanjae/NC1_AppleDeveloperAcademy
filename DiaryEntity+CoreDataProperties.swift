//
//  DiaryEntity+CoreDataProperties.swift
//  TheManU
//
//  Created by LeeWanJae on 4/16/24.
//
//

import Foundation
import CoreData


extension DiaryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DiaryEntity> {
        return NSFetchRequest<DiaryEntity>(entityName: "DiaryEntity")
    }

    @NSManaged public var context: String?
    @NSManaged public var id: UUID?

}

extension DiaryEntity : Identifiable {

}
