//
//  Notes+CoreDataProperties.swift
//  CoreDataNotesApp2
//
//  Created by M_955328 on 2/28/22.
//
//

import Foundation
import CoreData


extension Notes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notes> {
        return NSFetchRequest<Notes>(entityName: "Notes")
    }

    @NSManaged public var title: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var descrip: String?

}

extension Notes : Identifiable {

}
