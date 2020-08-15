//
//  TodoTableViewCell.swift
//  TodoApp
//
//  Created by Bruno Cardoso Ambrosio on 12/08/20.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    
    // MARK: - Convenience static vars
    static let reuseIdentifer = String(describing: TodoTableViewCell.self)
    
    static var nib: UINib {
        let nibName = String(describing: TodoTableViewCell.self)
        return UINib(nibName: nibName, bundle: nil)
    }
    
    // MARK: - Outlets
    @IBOutlet weak var isCompletedIcon: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var priorityLevelIcon: UIImageView!
    
    /// Configures the cell with a todo
    /// - Parameter todo: todo that will be used to configure the cell
    func configure(todo: Todo)  {
        let circleIconName = todo.isCompleted ? "checkmark.circle.fill" : "circle"
        
        isCompletedIcon.image = UIImage(systemName: circleIconName)
        priorityLevelIcon.image = UIImage(systemName: todo.priorityLevel.icon)
        title.text = todo.title
    }
}
