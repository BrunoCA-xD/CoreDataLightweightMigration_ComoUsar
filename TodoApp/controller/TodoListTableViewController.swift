//
//  TodoListTableViewController.swift
//  TodoApp
//
//  Created by Bruno Cardoso Ambrosio on 12/08/20.
//

import UIKit

class TodoListTableViewController: UITableViewController {

    // MARK: - Attributes
    var todoItems: [Todo] = []
    let todoDAO = TodoDAO()
    
    // MARK: - Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(TodoTableViewCell.nib,
                           forCellReuseIdentifier: TodoTableViewCell.reuseIdentifer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        todoItems = todoDAO.listAll()
        tableView.reloadData()
    }
    
    
    

    // MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todoItems.count
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let removedTodo = todoItems.remove(at: indexPath.row)
            todoDAO.delete(item: removedTodo)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoTableViewCell.reuseIdentifer, for: indexPath) as? TodoTableViewCell else {return UITableViewCell()}
        let item = todoItems[indexPath.row]
        
        cell.configure(todo: item)
        return cell
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        nil
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        nil
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoTableViewCell.reuseIdentifer, for: indexPath) as? TodoTableViewCell else {return}
        let item = todoItems[indexPath.row]
        item.completed.toggle()
        todoDAO.save()
        cell.configure(todo: item)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? AddTodoTableViewController {
            dest.delegate = self
        }
    }
}

// MARK: - AddTodoTableViewControllerDelegate
extension TodoListTableViewController: AddTodoTableViewControllerDelegate {
    func didAdd(todo: Todo) {
        todoDAO.insert(todo)
    }
}
