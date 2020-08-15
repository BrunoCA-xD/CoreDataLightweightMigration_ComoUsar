//
//  AddTodoTableViewController.swift
//  TodoApp
//
//  Created by Bruno Cardoso Ambrosio on 12/08/20.
//

import UIKit

protocol AddTodoTableViewControllerDelegate: class {
    func didAdd(todo: Todo)
}

class AddTodoTableViewController: UITableViewController {

    // MARK: - Attributes
    var todo: Todo = TodoDAO().genNew()
    weak var delegate: AddTodoTableViewControllerDelegate?

    // MARK: - Outlets
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var titleTextfield: UITextField!
    
    @IBAction func priorityLevelChanged(_ sender: Any) {
        guard let sender = sender as? UISegmentedControl else {return}
        let selectedIndex = 2 - sender.selectedSegmentIndex
        todo.priorityLevel = TodoPriority.allCases[selectedIndex]
    }
    
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        delegate?.didAdd(todo: todo)
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextfield.addTarget(self, action: #selector(Self.textDidChange(_:)), for: .allEditingEvents)
        
        if let text = todo.title, text.count > 0 {
            saveButton.isEnabled = true
        }else {
            saveButton.isEnabled = false
        }
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        1
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        nil
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        nil
    }
    
    // MARK: - @Objc
    @objc func textDidChange(_ sender: UITextField) {
        todo.title = sender.text
        if let text = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), text.count > 0 {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
}
