//
//  EntryListTableViewController.swift
//  JournalCoreData
//
//  Created by Ethan Scott on 4/26/21.
//

import UIKit

class EntryListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        EntryController.sharedInstance.fetchEntries()
    }
    
    var entry: Entry?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return EntryController.sharedInstance.entries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)

        let entry = EntryController.sharedInstance.entries[indexPath.row]
        
        cell.textLabel?.text = entry.title

        return cell
    }
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            guard let entry = entry else {return}
//            let entryToDelete = EntryController.sharedInstance.entries[indexPath.row]
//            EntryController.deleteEntry(entryToDelete)
//        }
//    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            guard let destinationVC = segue.destination as? EntryDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow else {return}
            
            let entry = EntryController.sharedInstance.entries[indexPath.row]
            destinationVC.entry = entry
        }
    }
}
