//
//  CoreDataController.swift
//  ToDo
//
//  Created by Ed Mosher on 2/8/17.
//  Copyright © 2017 Ed Mosher. All rights reserved.
//

import Foundation
import CoreData

class CoreDataController {
  
  private init() {
    
  }
  
  // Set up the Managed Object Context
  class func getContext() -> NSManagedObjectContext {
    return CoreDataController.persistentContainer.viewContext
  }
  
  // MARK: - Core Data stack
  static var persistentContainer: NSPersistentContainer = {

    let container = NSPersistentContainer(name: "ToDo")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()
  
  // MARK: - Core Data Saving support
  class func saveContext () {
    let context = persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {
        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }
}
