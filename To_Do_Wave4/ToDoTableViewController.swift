//
//  ToDoTableViewController.swift
//  To_Do_Wave4
//
//  Created by Maddie Dew on 8/2/21.
//

import UIKit

class ToDoTableViewController: UITableViewController {

    var toDos : [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDos = createToDos()
    }

        func createToDos() -> [ToDo] {
            let swift = ToDo()
            swift.name = "Learn Swift"
            swift.important = true
            
            let read = ToDo()
            read.name = "Read a book!"
            read.important = true
            
            let dishes = ToDo()
            dishes.name = "Wash Dishes"
            
            return [swift, read, dishes]
        }
        


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let toDo = toDos[indexPath.row]
        
        if toDo.important {
            cell.textLabel?.text = "❗️" + toDo.name
        }
        else {
            cell.textLabel?.text = toDo.name
        }

        return cell
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addViewController = segue.destination as? AddViewController {
            addViewController.previousViewController = self
        }
    }

}
