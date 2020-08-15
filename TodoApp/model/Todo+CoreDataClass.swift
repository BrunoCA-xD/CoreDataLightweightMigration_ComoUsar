//
//  Todo+CoreDataClass.swift
//  TodoApp
//
//  Created by Bruno Cardoso Ambrosio on 15/08/20.
//
//

import Foundation
import CoreData

@objc(Todo)
public class Todo: NSManagedObject {

    @NSManaged private var priorityLevelPrimitive: Int16
    var priorityLevel: TodoPriority {
      get {
        willAccessValue(forKey: "priorityLevel")
        defer { didAccessValue(forKey: "priorityLevel") }
        return TodoPriority(rawValue: priorityLevelPrimitive)!
      }
      set {
        willChangeValue(forKey: "priorityLevel")
        defer { didChangeValue(forKey: "priorityLevel") }
        priorityLevelPrimitive = newValue.rawValue
      }
    }
}
