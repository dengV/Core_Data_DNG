

import Foundation
import CoreData

/*
 CoreDataStack: As in previous chapters, this object wraps an NSPersistentStoreContainer object, which itself contains the cadre of Core Data objects known as the “stack”: the context, the model, the persistent store and the persistent store coordinator. No need to set this up — it comes ready-to-use.

 
 */


class TeaCoreDataStack {

  private let modelName: String

  init(modelName: String) {
    self.modelName = modelName
  }

  lazy var managedContext: NSManagedObjectContext = {
    return self.storeContainer.viewContext
  }()

  private lazy var storeContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: self.modelName)
    container.loadPersistentStores { (storeDescription, error) in
        if let error = error as NSError? {
          print("Unresolved error \(error), \(error.userInfo)")
        }
    }
    return container
  }()

  
  func saveContext () {
    guard managedContext.hasChanges else { return }

    do {
      try managedContext.save()
    } catch {
      let nserror = error as NSError
      print("Unresolved error \(nserror), \(nserror.userInfo)")
    }
  }
}
