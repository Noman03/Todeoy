//
//  ViewController.swift
//  Todeoy
//
//  Created by apple on 11/17/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController
{
    var itemArray  = ["Find Mike","Buy eggos","Destroy Demogorgon"]
    let defaults = UserDefaults.standard

    override func viewDidLoad()
    {
        super.viewDidLoad()
        if let items = defaults.array(forKey: "ToDoListArray") as? [String]
        {
            itemArray = items
        }
    }
    
    //MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //MARK - Tableview delgate method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //print(itemArray[indexPath.row])
        
        if (tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark)
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    //MARK - Add new items
    @IBAction func addPressedButton(_ sender: UIBarButtonItem)
    {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add item", style: .default)
        { (action) in
            print("Success!")
            self.itemArray.append(textField.text!)
            self.defaults.setValue(self.itemArray, forKey: "ToDoListArray")
            self.tableView.reloadData()
        }
        alert.addTextField
            { (alertTextField) in
                alertTextField.placeholder = "Create new item"
                textField = alertTextField
            }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    
}












