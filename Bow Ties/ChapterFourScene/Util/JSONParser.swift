//
//  JSONParser.swift
//  Bubble Tea Finder
//
//  Created by dengjiangzhou on 2018/3/30.
//  Copyright © 2018年 Razeware. All rights reserved.
//

import UIKit

//
import CoreData


class JSONParser: NSObject {

  
  lazy var coreDataStack = TeaCoreDataStack(modelName: "Bubble_Tea_Finder")
  
  
  
  
  func importJSONSeedDataIfNeeded() {
    let fetchRequest = NSFetchRequest<Venue>(entityName: "Venue")
    let count = try! coreDataStack.managedContext.count(for: fetchRequest)
    
    guard count == 0 else { return }
    
    do {
      let results = try coreDataStack.managedContext.fetch(fetchRequest)
      results.forEach({ coreDataStack.managedContext.delete($0) })
      
      coreDataStack.saveContext()
      // 上面 三行 代码， 感觉是 以防万一
      importJSONSeedData()
      //   方法 在这
    } catch let error as NSError {
      print("Error fetching: \(error), \(error.userInfo)")
    }
  }
  
  
  
  
  
  // https://www.bejson.com
  func importJSONSeedData() {
    let jsonURL = Bundle.main.url(forResource: "seed", withExtension: "json")!
    let jsonData = try! Data(contentsOf: jsonURL)
    
    let jsonDict = try! JSONSerialization.jsonObject(with: jsonData, options: [.allowFragments]) as! [String: Any]
    let responseDict = jsonDict["response"] as! [String: Any]
    let jsonArray = responseDict["venues"] as! [[String: Any]]
    
    for jsonDictionary in jsonArray {
      let venueName = jsonDictionary["name"] as? String
      let contactDict = jsonDictionary["contact"] as! [String: String]
      
      let venuePhone = contactDict["phone"]
      
      //
      
      let specialsDict = jsonDictionary["specials"] as! [String: Any]
      let specialCount = specialsDict["count"] as? NSNumber
      
      let locationDict = jsonDictionary["location"] as! [String: Any]
      let priceDict = jsonDictionary["price"] as! [String: Any]
      let statsDict =  jsonDictionary["stats"] as! [String: Any]
      
      let location = Location(context: coreDataStack.managedContext)
      location.address = locationDict["address"] as? String
      location.city = locationDict["city"] as? String
      location.state = locationDict["state"] as? String
      location.zipcode = locationDict["postalCode"] as? String
      let distance = locationDict["distance"] as? NSNumber
      location.distance = distance!.floatValue
      
      //
      
      let category = Category(context: coreDataStack.managedContext)
      
      //
      
      let priceInfo = PriceInfo(context: coreDataStack.managedContext)
      priceInfo.priceCategory = priceDict["currency"] as? String
      
      //
      
      let stats = Stats(context: coreDataStack.managedContext)
      let checkins = statsDict["checkinsCount"] as? NSNumber
      stats.checkinsCount = checkins!.int32Value
      let tipCount = statsDict["tipCount"] as? NSNumber
      stats.tipCount = tipCount!.int32Value
      
      //
      
      let venue = Venue(context: coreDataStack.managedContext)
      venue.name = venueName  //
      venue.phone = venuePhone  //
      venue.specialCount = specialCount!.int32Value  //
      
      venue.location = location  // relationShip
      venue.category = category   //  relationShip
      venue.priceInfo = priceInfo  // relationShip
      venue.stats = stats  // relationShip
    }
    
    coreDataStack.saveContext()
  }
  
  
  
  
  
}
