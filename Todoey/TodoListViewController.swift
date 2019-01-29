//
//  ViewController.swift
//  Todoey
//
//  Created by Dvontre Coleman on 1/7/19.
//  Copyright © 2019 Dvontre A Coleman. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Get Toothpaste", "Grind", "Keep Grinding"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: - Tableview Datasource Methods
    
    // function for what to display at row index
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
        
    }
    
    // function to tell the table how many rows to display
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //MARK: - tableview Delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            // removes the checkmark from the tapped cell
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        } else{
            // adds a checkmark to the tapped cell
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        // Disables the grey background of tapped cell
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK: Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        // Create a variable for the toDo text field
        var textField = UITextField()
        // create a new alert
        let alert = UIAlertController(title: "Add New Todoey item", message: "", preferredStyle: .alert)
        // create a new action
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // What happens once user clicks add Item on the UI alert
            print("success")
            print(textField.text!)
            // Adds the textfield text to the item array
            self.itemArray.append(textField.text!)
            // Reloads the table view when new item is added
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            // Sets the do do text field to be the alert text field for scope
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

