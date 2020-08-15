//
//  TodoDAO.swift
//  TodoApp
//
//  Created by Bruno Cardoso Ambrosio on 12/08/20.
//

import Foundation

struct TodoDAO {
    typealias ManagedEntity = Todo
    private let context = CoreDataDAO.shared.persistentContainer.viewContext
    
    /// List all the habits in the database sorted by the priority  level
    /// - Returns: a list with all elements in database
    func listAll() -> [ManagedEntity] {
        var elements: [ManagedEntity] = []
        
        do {
            elements = try context.fetch(ManagedEntity.fetchRequest())
        }catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        // Sorts the list by the higher priority
        elements.sort {
            $0.priorityLevel > $1.priorityLevel
        }
        return elements
    }
    
    /// Generates a new element using its entity description
    /// - Returns: a new element to be used
    func genNew() -> ManagedEntity {
        return ManagedEntity(entity: ManagedEntity.entity(), insertInto: nil)
    }
    
    /// Inserts an item in thee  context and saves it
    /// - Parameter item: item to be inserted and saved
    func insert(_ item: ManagedEntity) {
        context.insert(item)
        save()
    }
    
    /// Saves the context, can after an item update
    func save() {
        CoreDataDAO.shared.saveContext()
    }
    
    /// Calls the generic method to delete an item
    /// - Parameter item: item to be deleted
    func delete(item: ManagedEntity) {
        CoreDataDAO.shared.delete(item: item)
    }
}
