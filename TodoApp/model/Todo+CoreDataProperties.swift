//
//  Todo+CoreDataProperties.swift
//  TodoApp
//
//  Created by Bruno Cardoso Ambrosio on 12/08/20.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var title: String?
    @NSManaged public var completed: Bool

}
