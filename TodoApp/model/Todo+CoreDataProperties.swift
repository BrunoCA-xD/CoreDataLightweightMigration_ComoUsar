//
//  Todo+CoreDataProperties.swift
//  TodoApp
//
//  Created by Bruno Cardoso Ambrosio on 15/08/20.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var isCompleted: Bool
    @NSManaged public var title: String?
}
