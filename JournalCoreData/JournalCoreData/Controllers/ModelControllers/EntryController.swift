//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Ethan Scott on 4/26/21.
//

import CoreData

class EntryController {
    
    static let sharedInstance = EntryController()
    var entries: [Entry] = []
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    private init() {}
    
    //MARK: - Functions
    func createEntry(title: String, body: String) {
        let entry = Entry(title: title, bodyText: body)
        entries.append(entry)
        
        CoreDataStack.saveContext()
    }
    
    func fetchEntries() {
        let entries = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        print(entries.count)
        self.entries = entries
    }
    
    func updateEntry(_ entry: Entry) {
        CoreDataStack.saveContext()
    }
    
//    func deleteEntry(entry: Entry) {
//        if let index = entries.firstIndex(of: entry) {
//        entries.remove(at: index)
//        }
//    }
}//End of class
