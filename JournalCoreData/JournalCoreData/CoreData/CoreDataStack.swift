//
//  CoreDataStack.swift
//  JournalCoreData
//
//  Created by Ethan Scott on 4/26/21.
//

import CoreData

enum CoreDataStack {
    
    static let container: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "JournalCoreData")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Error loading persistent stores \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    static var context: NSManagedObjectContext {container.viewContext}
    
    static func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            }catch{
                print("Error saving context \(error)")
            }
        }
    }
    
}//end of enum
