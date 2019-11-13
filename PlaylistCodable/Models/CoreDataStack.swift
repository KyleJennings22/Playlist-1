//
//  CoreDataStack.swift
//  PlaylistCodable
//
//  Created by Kyle Jennings on 11/13/19.
//  Copyright © 2019 Aaron Martinez. All rights reserved.
//

import Foundation
import CoreData

// Creating a class called CoreDataStack.
class CoreDataStack {
    // Creating and Initializing the persistent container
    static let container: NSPersistentContainer = {
        // Creating the container
        let container = NSPersistentContainer(name: "PlaylistCodable")
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
            
        }
        return container
    }()
    
    // Creating a variable that allows us to access the context throughout the app
    static var context: NSManagedObjectContext {return container.viewContext}
}
