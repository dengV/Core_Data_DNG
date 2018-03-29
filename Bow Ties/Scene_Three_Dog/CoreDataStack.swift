//
//  CoreDataStack.swift
//  Bow Ties
//
//  Created by dengjiangzhou on 2018/3/29.
//  Copyright © 2018年 Razeware. All rights reserved.
//

import Foundation


import CoreData


class CoreDataStack{
  private let modelName: String
  
  
  
  lazy var managedContext: NSManagedObjectContext = {
    return self.storeContainer.viewContext
  }()
  
  init(modelName: String) {
    self.modelName = modelName
  }
  
  private lazy var storeContainer: NSPersistentContainer = {
    
    let container = NSPersistentContainer(name: self.modelName)
    
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
          if let error = error as NSError? {
              print("Unresolved error \(error), \(error.userInfo)")
          }
    })
    
    return container
  }()
  
  
  func savaContext(){
    guard managedContext.hasChanges else{
      return
    }
    
    
    do {
        try managedContext.save()
    } catch let error as NSError {
        print("Unresolved error \(error), \(error.userInfo)")
    }
    
    
  }
  
  
}
