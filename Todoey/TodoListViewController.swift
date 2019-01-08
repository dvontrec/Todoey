//
//  ViewController.swift
//  Todoey
//
//  Created by Dvontre Coleman on 1/7/19.
//  Copyright © 2019 Dvontre A Coleman. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Get Toothpaste", "Grind", "Keep Grinding"]
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

}

