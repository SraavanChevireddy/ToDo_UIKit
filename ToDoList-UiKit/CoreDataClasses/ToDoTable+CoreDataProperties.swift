//
//  ToDoTable+CoreDataProperties.swift
//  ToDoList-UiKit
//
//  Created by Sraavan Chevireddy on 6/8/22.
//
//

import Foundation
import CoreData


extension ToDoTable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoTable> {
        return NSFetchRequest<ToDoTable>(entityName: "ToDoTable")
    }

    @NSManaged public var category: String?
    @NSManaged public var toDo: String?
    @NSManaged public var createdTime: Date?
    @NSManaged public var id: UUID?

}

extension ToDoTable : Identifiable {

}
