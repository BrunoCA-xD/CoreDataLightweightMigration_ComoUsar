//
//  TodoPriorityEnum.swift􀄤
//  TodoApp
//
//  Created by Bruno Cardoso Ambrosio on 14/08/20.
//

import Foundation

enum TodoPriority: Int16, CaseIterable {
    case low = 0
    case medium = 1
    case high = 2
}

extension TodoPriority: Comparable {
    static func < (lhs: TodoPriority, rhs: TodoPriority) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    
}


extension TodoPriority {
    var icon: String {
        switch self {
        case .low:
            return "chevron.down"
        case .medium:
            return "minus"
        case .high:
            return "chevron.up"
        }
    }
}
