//
//  Note.swift
//  CoreDataNotesApp
//
//  Created by M_955328 on 2/28/22.
//

import CoreData

@objc(Note)
class Note: NSManagedObject{
    
    @NSManaged var id: NSNumber!
    @NSManaged var title: String!
    @NSManaged var descrip: String!
    @NSManaged var deletedDate: Date?



}
