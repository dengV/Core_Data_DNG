//
//  HaveATry.swift
//  Bow Ties
//
//  Created by dengjiangzhou on 2018/3/30.
//  Copyright © 2018年 Razeware. All rights reserved.
//

import Foundation
import UIKit
import CoreData




class TryPlease{
  
  let managedContext: NSManagedObjectContext? = {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
      else{
        return nil
    }
    return appDelegate.persistentContainer.viewContext
  }()
  
  
  
  
  func fetchOne(){
      let fetchRequestOne = NSFetchRequest<Bowtie>()
      let entity = NSEntityDescription.entity(forEntityName: "Bowtie", in: managedContext!)
      fetchRequestOne.entity = entity
  }
/*
   open class NSFetchRequest<ResultType> : NSPersistentStoreRequest, NSCoding where ResultType : NSFetchRequestResult {
   
   */
  
  
  
  
  func fetchTwo(){
    //  let fetchRequestTwo = NSFetchRequest<Bowtie>(entityName: "Bowtie")
  }
  
  
  
  func fetchThree(){
   // let fetchRequestThree: NSFetchRequest<Bowtie> = Bowtie.fetchRequest()
    
  }
/*
   
   @nonobjc public class func fetchRequest() -> NSFetchRequest<Bowtie> {
   return NSFetchRequest<Bowtie>(entityName: "Bowtie")
   }
   
   */
  
  
  // MARK: - Chapter Only
  
  func fetchFour(){
    
    
    
  }
  
  
  
  func fetchFive(){
    
    
    
  }
  
}
